module Order::OrderRepository
  def insert(order)
    puts "Order saved with label: #{order.label}"
    raise "Not implemented"
  end
end
