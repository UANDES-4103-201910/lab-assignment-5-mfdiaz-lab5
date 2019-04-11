class EventVenuesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event_venue, only: [:show, :update, :destroy]

  def index
    render json: EventVenue.all
  end

  def create
    event_venue = EventVenue.new(event_venue_params)
    if event_venue.save
      render json: event_venue
    else
      render json: event_venue.errors
    end
  end

  def destroy
    @event_venue.destroy
    render json: "{\"status\" : \"Event Venue deleted\"}"
  end

  def update
    if @event_venue.update(event_venue_params)
      render json: @event_venue
    else
      render json: @event_venue.errors
    end
  end

  def show
    render json: @event_venue
  end

  private
    def set_event_venue
      @event_venue = EventVenue.find(params[:id])
    end

    def event_venue_params
      params.require(:event_venue).permit(:name, :address, :capacity)
    end  
end
