class Order::OrderEntity
  def initialize(id, label, customer)
    @id = id
    @label = label
    @customer = customer
    @line_items = []
  end

  def id
    @id
  end

  def label
    @label
  end

  def customer
    @customer
  end

  def line_items
    @line_items
  end

  def add_line_item(line_item_param)
    line_item = Order::LineItemEntity.new(line_item_param[:id], line_item_param[:label], line_item_param[:quantity], line_item_param[:ram], line_item_param[:storage], line_item_param[:screen_size], line_item_param[:price], line_item_param[:order_id])
    @line_items << line_item
  end

  def status
    if line_items.empty?
      OrderStatus::CREATED
    end

    if line_items.any? { |line_item| line_item.price.nil? }
      OrderStatus::INCOMPLETE
    else
      OrderStatus::COMPLETE
    end
  end
end

module OrderStatus
  CREATED = "Created"
  INCOMPLETE = "Incomplete"
  COMPLETE = "Complete"
end
