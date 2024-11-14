require "test_helper"

class Order::CreateOrderUseCaseTest < ActionDispatch::IntegrationTest
  @order_repo = Db::OrderRepositoryMock.new
  @use_case = Order::CreateOrderService.new(@order_repo)

  test "Should create a new order" do
    get rest_orders_url
    assert_response :success
  end
end
