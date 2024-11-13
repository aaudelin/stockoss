class Rest::OrdersController < ApplicationController
  def index
    render json: { orders: ["Order 1", "Order 2", "Order 3"] }
  end

  def show
    render json: { order: "Order #{params[:id]}" }
  end
end


