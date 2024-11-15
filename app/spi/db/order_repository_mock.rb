require "test_helper"

class Db::OrderRepositoryMock
  include Order::Repository

  def initialize
    super
  end

  def insert(order)
    puts "Repo mock - Order saved with label: #{order.label}"
    order
  end

  def update_line_price(line_id, price)
    puts "Repo mock - Line updated with id: #{line_id} and price: #{price}"
  end
end
