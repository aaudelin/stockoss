require "test_helper"

class Db::OrderTest < ActionDispatch::IntegrationTest
  test "Should save order in database" do
    order = Db::Order.insert({ label: "Order 1", customer: "Customer 1" })
    order.inspect
    assert_not_nil order
    assert_not_nil order.id
  end
end

