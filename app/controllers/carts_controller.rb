class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tour = Tour.new
  end

  def create
    return render json: {status: false} if cart_params[:quantity].to_i.zero?
    render json: {status: add_to_cart(cart_params)}
  end

  def destroy
    render json: {
      status: delete_cart_item(cart_params[:tour_id])
    }
  end

  def update
    render json: {
      status: update_cart(cart_params)
    }
  end

private
  def cart_params
    params.require(:tour).permit :tour_id, :quantity, :date
  end

  def init_session_cart
    session[:cart] ||= {}
  end
end
