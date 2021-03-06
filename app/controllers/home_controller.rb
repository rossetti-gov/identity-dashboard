class HomeController < ApplicationController
  def index
    @deploy_statuses = deploy_status_checker.check!
  end

  protected

  def deploy_status_checker
    @deploy_status_checker ||= DeployStatusChecker.new
  end
end
