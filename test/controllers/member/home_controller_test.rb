require 'test_helper'

class Member::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get member_home_top_url
    assert_response :success
  end

  test "should get about" do
    get member_home_about_url
    assert_response :success
  end

end
