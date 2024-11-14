require "test_helper"

class Db::OrderRepositoryMock
  include Order::OrderRepository

  def initialize
    super
  end

  def insert(order)
    puts "Repo mock - Order saved with label: #{order.label}"
    order
  end
end
