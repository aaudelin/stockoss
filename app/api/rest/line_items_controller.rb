class Rest::LineItemsController < ApplicationController
  def index
    line_items = Db::Order.find(params[:order_id]).line_items
    line_items = line_items.map { |line_item| { label: line_item.label, links: { self: rest_line_item_url(params[:order_id], line_item.id) } } }
    render json: { line_items: line_items, links: { self: rest_line_items_url } }
  end

  def show
    line_item = Db::LineItem.find(params[:id])
    render json: {
      line_item: line_item,
      links: {
        self: rest_line_item_url(line_item.id),
        validate: !line_item.price ? rest_line_item_validate_url(params[:order_id], line_item.id) : nil
      }
    }

  end

  def create
    params.permit!
    line_item = Db::LineItem.create(params[:line_item])
    render json: {
      line_item: line_item,
      links: {
        self: rest_line_item_url(params[:order_id], line_item.id),
        validate: rest_line_item_validate_url(params[:order_id], line_item.id)
      }
    }, status: :created
  end

  def validate
    # Better DI
    order_repo = Db::SqliteOrderRepository.new
    validate_use_case = LineItem::ValidateService.new(order_repo)

    line_item = validate_use_case.execute(params[:id], params[:price])
    render json: { line_item: line_item, links: { self: rest_line_item_url(params[:order_id], line_item.id) } }
  end
end
