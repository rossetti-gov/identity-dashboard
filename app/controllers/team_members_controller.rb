class TeamMembersController < ApplicationController
  def create
    service_provider = ServiceProvider.find(params[:service_provider_id])
    team_member = service_provider.team_members.create(team_member_params)
    team_member.save!
    redirect_to(users_service_provider_path(team_member.service_provider_id))
  end

  def destroy
    team_member = TeamMember.find(params[:id])
    team_member.destroy
    redirect_to(users_service_provider_path(params[:service_provider_id]))
  end

  private
  def team_member_params
    params.require(:service_provider).permit(
      :user_id,
    )
  end
end
