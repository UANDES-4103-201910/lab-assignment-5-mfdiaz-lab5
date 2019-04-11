class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    render json: Event.all
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: event
    else
      render json: event.errors
    end
  end

  def destroy
    @event.destroy
    render json: "{\"status\" : \"Event deleted\"}"
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors
    end
  end

  def show
    render json: @event
  end

  def upcoming_events
    render json: Event.where(start_date: Time.now .. 3.months.from_now)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :start_date, :event_venue_id)
    end  
end
