class TeamsUsersController < ApplicationController
  before_filter :find_team, only: :create
  before_filter :find_event, only: :create

  def create
    @team.users << current_user
    @event.users << current_user unless @event.users.find_by(id: current_user.id)
    if @team.save
      redirect_to :back
    else
      flash[:error] = @team.errors.full_message.first
      redirect_to :back
    end
  end

  private

  def find_team
    team_id = params[:team_id]
    @team = Team.find(team_id)
  end

  def find_event
    event_id = params[:event_id]
    @event = Event.find(event_id)
  end
end
