class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors
    end
  end

  def destroy
    @user.destroy
    render json: "{\"status\" : \"User deleted\"}"
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors
    end
  end

  def show
    render json: @user
  end

  def user_with_most_tickets
    user_tickets = User.joins(orders: :tickets).group(:user_id).order('count_all desc').count
    user_with_most_tickets_id = user_tickets.first.first
    render json: User.find(user_with_most_tickets_id)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :lastname, :email, :password, :address)
    end
end
