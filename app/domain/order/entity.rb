class Order::Entity
  def initialize(label, customer)
    @label = label
    @customer = customer
    @id = nil
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

  def self.new_draft(customer)
    label = "#{customer}-#{Time.now.strftime("%H%M%S")}"
    Order::Entity.new(label, customer)
  end

  def add_line_item(line_item)
    @line_items << line_item
  end

  def add_line_items(line_items)
    line_items.each do |line_item|
      add_line_item(line_item)
    end
  end

  def find_line_item(line_item_id)
    @line_items.find { |line_item| line_item.id.to_i === line_item_id.to_i }
  end

  def status
    if line_items.empty?
      return OrderStatus::CREATED
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
