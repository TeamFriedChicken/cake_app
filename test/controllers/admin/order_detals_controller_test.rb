require 'test_helper'

class Admin::OrderDetalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_order_detals_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_order_detals_show_url
    assert_response :success
  end

end
