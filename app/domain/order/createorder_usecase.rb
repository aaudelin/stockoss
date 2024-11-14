class Order::CreateOrderUseCase
  def initialize(order_repo)
    @order_repo = order_repo
  end

  def execute(order_params)
    order = Order::OrderEntity.new(order_params[:id], order_params[:label], order_params[:customer])
    @order_repo.save(order)
    order
  end
end
