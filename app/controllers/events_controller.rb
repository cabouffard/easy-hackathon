class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
    event_id = params[:id]
    @event = Event.find(event_id)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      flash[:error] = @event.errors.full_messages.first
      render :new
    end
  end


  def delete
  end

  def destroy
  end

  def update
    event_id = params[:id]
    @event = Event.find(event_id)

    if @event.update(event_params)
      redirect_to events_path
    else
      flash[:error] = @event.errors.full_messages.first
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
