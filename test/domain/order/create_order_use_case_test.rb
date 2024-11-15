require "test_helper"

class Order::CreateOrderUseCaseTest < ActiveSupport::TestCase
  order_repo = Db::OrderRepositoryMock.new
  use_case = Order::CreateService.new(order_repo)

  test "Should create a new order" do
    order_params = { customer: "Customer 1" }
    order = use_case.execute(order_params)

    assert_not_nil order
    assert_not_nil order.label
    assert_equal order_params[:customer], order.customer
    assert_equal OrderStatus::CREATED, order.status
  end
end
