require 'rails_helper'

feature 'Service Providers CRUD' do
  xcontext 'Regular user' do
    scenario 'can create service provider' do
      user = create(:user)
      login_as(user)

      visit new_service_provider_path

      fill_in 'Friendly name', with: 'test service_provider'
      fill_in 'service_provider_logo', with: 'test.png'
      check 'email'
      check 'first_name'
      click_on 'Create'

      expect(page).to have_content('Success')
      expect(page).to have_content(I18n.t('notices.service_providers_refreshed'))
      within('table.horizontal-headers') do
        expect(page).to have_content('test service_provider')
        expect(page).to have_content('email')
        expect(page).to have_content('first_name')
        expect(page).to have_css('img[src*=sp-logos]')
        expect(page).to have_content('Openid connect')
      end
    end

    scenario 'can update service provider with multiple redirect uris' do
      user = create(:user)
      service_provider = create(:service_provider, user: user)
      login_as(user)

      visit edit_service_provider_path(service_provider)
      fill_in 'service_provider_redirect_uris', with: 'https://foo.com'
      click_on 'Update'

      service_provider.reload
      expect(service_provider.redirect_uris).to eq(['https://foo.com'])

      visit edit_service_provider_path(service_provider)
      page.all('[name="service_provider[redirect_uris][]"]')[1].set 'https://bar.com'
      click_on 'Update'

      service_provider.reload
      expect(service_provider.redirect_uris).to eq(['https://foo.com', 'https://bar.com'])

      visit edit_service_provider_path(service_provider)
      page.all('[name="service_provider[redirect_uris][]"]')[0].set ''
      click_on 'Update'

      service_provider.reload
      expect(service_provider.redirect_uris).to eq(['https://bar.com'])
    end
  end

  xcontext 'admin user' do
    scenario 'can create service provider with user group and approval' do
      admin = create(:admin)
      agency = create(:agency)
      group = create(:group)
      login_as(admin)

      visit new_service_provider_path

      choose('service_provider_approved_true')
      select group, from: 'service_provider[group_id]'
      fill_in 'Friendly name', with: 'test service_provider'
      select agency.name, from: 'service_provider[agency_id]'
      check 'email'
      check 'first_name'
      click_on 'Create'

      expect(page).to have_content('Success')
    end

    scenario 'can publish service providers' do
      admin = create(:admin)
      login_as(admin)

      visit service_providers_path

      click_on t('forms.buttons.trigger_idp_refresh')
      expect(page).to have_content(I18n.t('notices.service_providers_refreshed'))
    end
  end

  xcontext 'Update' do
    scenario 'user updates service provider' do
      user = create(:user)
      app = create(:service_provider, user: user)
      login_as(user)

      visit edit_service_provider_path(app)

      fill_in 'Friendly name', with: 'change service_provider name'
      fill_in 'Description', with: 'app description foobar'
      choose 'Saml'
      check 'last_name'
      click_on 'Update'

      expect(page).to have_content('Success')
      expect(page).to have_content(I18n.t('notices.service_providers_refreshed'))
      within('table.horizontal-headers') do
        expect(page).to have_content('app description foobar')
        expect(page).to have_content('change service_provider name')
        expect(page).to have_content('last_name')
        expect(page).to have_content('Identity ProtocolSaml')
      end
    end

    xcontext 'service provider does not have a user group' do
      scenario 'user group defaults to nil' do
        ug = create(:group)
        user = create(:user, groups: [ug])

        app = create(:service_provider, user: user)
        login_as(user)

        visit edit_service_provider_path(app)
        click_on 'Update'
        expect(page).to_not have_content(ug.name)
      end
    end
  end

  scenario 'Read' do
    user = create(:user)
    group = create(:group)
    app = create(:service_provider, group: group, user: user)
    login_as(user)

    visit service_provider_path(app)

    expect(page).to have_content(app.friendly_name)
    expect(page).to have_content(group)
    expect(page).to_not have_content('All service providers')
  end

  xscenario 'Delete' do
    user = create(:user)
    app = create(:service_provider, user: user)
    login_as(user)

    visit service_provider_path(app)
    click_on 'Delete'

    expect(page).to have_content('Success')
  end
end
