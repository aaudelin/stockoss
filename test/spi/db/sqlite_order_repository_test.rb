require "test_helper"

class Db::SqliteOrderRepositoryTest < ActionDispatch::IntegrationTest
  test "Should save order in SQLite database" do
    order = Db::SqliteOrderRepository.new.insert(
      Order::Entity.new("Order 1", "Customer 1")
    )
    order.inspect
    assert_not_nil order
    assert_not_nil order.id
  end
end

