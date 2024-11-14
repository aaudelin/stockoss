require "test_helper"

class LineItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rest_line_items_url
    assert_response :success
  end

  test "should get show" do
    get rest_line_item_url(1)
    assert_response :success
  end

  test "should post create" do
    post rest_line_items_url
    assert_response :success
  end

  test "should get validate" do
    put rest_line_item_validate_url(1)
    assert_response :success
  end
end
