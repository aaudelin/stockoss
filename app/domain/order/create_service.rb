class Order::CreateService
  include Order::CreateUseCase

  def initialize(order_repo)
    @order_repo = order_repo
  end


  def execute(order_params)
    puts "Use case - Creating order for customer: #{order_params[:customer]}"
    order = Order::Entity.new_draft(order_params[:customer])
    @order_repo.insert(order)
  end
end
