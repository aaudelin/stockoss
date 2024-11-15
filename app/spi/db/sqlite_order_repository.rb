class Db::SqliteOrderRepository
  include Order::Repository

  def insert(order)
    puts "Repository - Saving order: #{order.inspect}"
    new_order = Db::Order.new(label: order.label, customer: order.customer)
    new_order.save
    puts "Order saved with id: #{new_order.id}"
    new_order
  end

  def update_line_price(line_id, price)
    puts "Repository - Updating line price: #{line_id} with price: #{price}"
    line = Db::LineItem.find(line_id)
    line.price = price
    line.save

    order_db = Db::Order.find(line.order_id)
    order = Order::Entity.new(order_db.id, order_db.label, order_db.customer)
    order.add_line_items(
      order_db.line_items.map {
        |line_item| LineItem::Entity.new(
          line_item.id,
          line_item.label,
          line_item.quantity,
          line_item.ram,
          line_item.storage,
          line_item.screen_size,
          line_item.price,
          line_item.order_id
        )
      }
    )
    order
  end
end
