require "test_helper"

class Db::OrderRepositoryMock
  include Order::OrderRepository

  def initialize
    super
  end

  def insert(order)
    puts "Order saved with label: #{order.label}"
  end
end
