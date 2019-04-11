class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_ticket, only: [:show, :update, :destroy]

  def index
    if params[:ticket_type_id]
      render json: TicketType.find(params[:ticket_type_id]).tickets
    else
      render json: Ticket.all
    end
  end

  def create
    ticket = Ticket.new(ticket_params)
    if ticket.save
      render json: ticket
    else
      render json: ticket.errors
    end
  end

  def destroy
    @ticket.destroy
    render json: "{\"status\" : \"Ticket deleted\"}"
  end

  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors
    end
  end

  def show
    render json: @ticket
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:ticket_type_id, :order_id)
    end
end
