module Order::OrderRepository
  def save(order)
    puts "Order saved with label: #{order.label}"
    raise "Not implemented"
  end
end
