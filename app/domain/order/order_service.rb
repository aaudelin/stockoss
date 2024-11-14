class Order::OrderService
  include Order::CreateOrderUseCase

  def initialize(order_repo)
    @order_repo = order_repo
  end


  def execute(order_params)
    puts "Use case - Creating order for customer: #{order_params[:customer]}"
    order = Order::OrderEntity.new_draft(order_params[:customer])
    @order_repo.insert(order)
  end
end
