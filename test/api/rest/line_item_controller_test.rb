require "test_helper"

class LineItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rest_line_items_url(1)
    assert_response :success
  end

  test "should get show" do
    get rest_line_item_url(1, 1)
    assert_response :success
  end

  test "should post create" do
    post rest_line_items_create_url(1), params: {
      line_item: { label: "Macbook Pro M4", quantity: 4, order_id: 1, ram: "16GO", storage: "512GO", screen_size: "16" }
    }
    assert_response :success
  end

  test "should put validate" do
    put rest_line_item_validate_url(1, 1), params: { price: 2000 }
    assert_response :success
  end
end
