require "test_helper"

class Order::CreateOrderUseCaseTest < ActionDispatch::IntegrationTest
  order_repo = Db::OrderRepositoryMock.new
  use_case = Order::OrderService.new(order_repo)

  test "Should create a new order" do
    order_params = { label: "Order 1", customer: "Customer 1" }
    order = use_case.execute(order_params)
    assert_equal order_params[:label], order.label
    assert_equal order_params[:customer], order.customer
    assert_equal OrderStatus::CREATED, order.status
  end
end
