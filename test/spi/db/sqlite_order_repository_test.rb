require "test_helper"

class Db::SqliteOrderRepositoryTest < ActionDispatch::IntegrationTest
  test "Should save order in SQLite database" do
    order = Db::SqliteOrderRepository.insert({ label: "Order 1", customer: "Customer 1" })
    order.inspect
    assert_not_nil order
    assert_not_nil order.id
  end
end

