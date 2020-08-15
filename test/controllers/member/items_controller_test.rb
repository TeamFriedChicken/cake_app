require 'test_helper'

class Member::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_items_index_url
    assert_response :success
  end

  test "should get show" do
    get member_items_show_url
    assert_response :success
  end

end
