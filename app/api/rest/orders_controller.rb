class Rest::OrdersController < ApplicationController

  def index
    orders = Db::Order.all
    orders = orders.map { |order| { id: order.id, label: order.label, customer: order.customer, links: { self: rest_order_url(order.id) } } }
    render json: { orders: orders }
  end

  def show
    order = Db::Order.find(params[:id])
    render json: { order: order }
  end

  def create
    # Check DI implementation
    order_repo = Db::SqliteOrderRepository.new
    order_create_usecase = Order::CreateService.new(order_repo)

    order = order_create_usecase.execute(params[:order])
    render json: { order: order }, status: :created
  end
end


