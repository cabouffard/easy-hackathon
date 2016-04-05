class TeamsController < ApplicationController
  before_filter :find_event
  before_filter :find_team, only: [:edit, :destroy, :update, :show]

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.admin = current_user
    if @team.save
      redirect_to event_path(@event)
    else
      flash[:error] = @team.errors.full_messages.first
      render :new
    end
  end

  def destroy
    @team.destroy
    flash[:success] = t('events.destroy.success')
    redirect_to events_path
  end

  def update
    if @team.update(team_params)
      redirect_to events_path
    else
      flash[:error] = @team.errors.full_messages.first
      render :edit
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

  def team_params
    params.require(:team).permit(:event_id, :status, :name)
  end
end
