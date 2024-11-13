require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "Should return success on controller list" do
    get rest_orders_url
    assert_response :success
  end
end
