class Rest::OrdersController < ApplicationController
  def index
    render json: { orders: [ { label: "Order 1", links: { self: rest_order_url(1) } }, "Order 2", "Order 3"], links: { self: rest_orders_url } }
  end

  def show
    render json: { order: "Order #{params[:id]}" }
  end

  def create
    @order = Db::Order.new(label: "Order #{Db::Order.count + 1}", customer: "Customer", status: "Pending")
    @order.insert
    render json: { order: @order.label, links: { self: rest_order_url(@order.id) } }, status: :created
  end
end


