class LineItem::LineItemEntity

  def initialize(id, label, quantity, ram, storage, screen_size, price, order_id)
    @id = id
    @label = label
    @quantity = quantity
    @ram = ram
    @storage = storage
    @screen_size = screen_size
    @price = price
    @order_id = order_id
  end

  def id
    @id
  end

  def label
    @label
  end

  def quantity
    @quantity
  end

  def ram
    @ram
  end

  def storage
    @storage
  end

  def screen_size
    @screen_size
  end

  def price
    @price
  end

  def order_id
    @order_id
  end

  def approve(price)
    @price = price
  end

end
