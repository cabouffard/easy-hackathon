class EventsUsersController < ApplicationController
  before_filter :find_event, only: :create

  def create
    @event.users << current_user
    if @event.save
      redirect_to :back
    else
      flash[:error] = @event.errors.full_message.first
      redirect_to :back
    end
  end

  private

  def find_event
    event_id = params[:event_id]
    @event = Event.find(event_id)
  end
end
