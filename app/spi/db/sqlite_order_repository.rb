class Db::SqliteOrderRepository
  include Order::OrderRepository

  def insert(order)
    puts "Repository - Saving order: #{order.inspect}"
    new_order = Db::Order.new(label: order.label, customer: order.customer)
    new_order.save
    puts "Order saved with id: #{new_order.id}"
    new_order
  end
end
