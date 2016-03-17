class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def new
    @event = Event.new
  end

  def delete
  end

  def destroy
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
