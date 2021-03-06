module Users
  class SessionsController < Devise::SessionsController
    include ::ActionView::Helpers::DateHelper

    prepend_before_action :skip_timeout, only: [:active]
    skip_before_action :session_expires_at, only: [:active]

    def skip_timeout
      request.env['devise.skip_trackable'] = true
    end

    def new
      flash.clear
      redirect_to user_saml_omniauth_authorize_path
    end

    def active
      response.headers['Etag'] = '' # clear etags to prevent caching
      render json: { live: current_user.present?, timeout: session[:session_expires_at] }
    end

    def timeout
      flash[:notice] = I18n.t(
        'session_timedout',
        session_timeout: distance_of_time_in_words(Devise.timeout_in),
      )
      redirect_to root_url
    end

    def destroy
      @_user_uuid = current_user.uuid
      super
    end

    def after_sign_out_path_for(_user)
      saml_settings = OneLogin::RubySaml::Settings.new(Saml::Config::SETTINGS.dup)
      saml_settings.name_identifier_value = @_user_uuid
      OneLogin::RubySaml::Logoutrequest.new.create(saml_settings)
    end
  end
end
