require "test_helper"

class LineItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get line_item_index_url
    assert_response :success
  end

  test "should get show" do
    get line_item_show_url
    assert_response :success
  end

  test "should get create" do
    get line_item_create_url
    assert_response :success
  end

  test "should get validate" do
    get line_item_validate_url
    assert_response :success
  end
end
