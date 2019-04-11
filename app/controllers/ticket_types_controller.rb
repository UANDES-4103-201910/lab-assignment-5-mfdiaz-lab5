class TicketTypesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_ticket_type, only: [:show, :update, :destroy]

  def index
    render json: TicketType.all
  end

  def create
    ticket_type = TicketType.new(ticket_type_params)
    if ticket_type.save
      render json: ticket_type
    else
      render json: ticket_type.errors
    end
  end

  def destroy
    @ticket_type.destroy
    render json: "{\"status\" : \"Ticket Type deleted\"}"
  end

  def update
    if @ticket_type.update(ticket_type_params)
      render json: @ticket_type
    else
      render json: @ticket_type.errors
    end
  end

  def show
    render json: @ticket_type
  end

  private
    def set_ticket_type
      @ticket_type = TicketType.find(params[:id])
    end

    def ticket_type_params
      params.require(:ticket_type).permit(:event_id, :price, :ticket_zone_id)
    end
end
