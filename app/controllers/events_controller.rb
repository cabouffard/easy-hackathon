class EventsController < ApplicationController
  before_filter :find_event, only: [:edit, :destroy, :update, :show]

  def index
    @events = []
    50.times do
      @events = @events + Event.all
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
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

  def destroy
    @event.destroy
    flash[:success] = t('events.destroy.success')
    redirect_to events_path
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      flash[:error] = @event.errors.full_messages.first
      render :edit
    end
  end

  private

  def find_event
    event_id = params[:id]
    @event = Event.find(event_id)
  end

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
