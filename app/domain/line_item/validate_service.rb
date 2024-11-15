class LineItem::ValidateService
  include LineItem::ValidateUseCase

  def initialize(order_repo)
    @order_repo = order_repo
  end

  def execute(line_item_id, price)
    puts "Use case - Validating line item price: #{line_item_id}"
    order = @order_repo.update_line_price(line_item_id, price)
    order.find_line_item(line_item_id)
  end
end
