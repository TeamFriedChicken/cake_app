require 'test_helper'

class Member::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get member_members_show_url
    assert_response :success
  end

  test "should get edit" do
    get member_members_edit_url
    assert_response :success
  end

  test "should get update" do
    get member_members_update_url
    assert_response :success
  end

  test "should get resignation" do
    get member_members_resignation_url
    assert_response :success
  end

  test "should get quit" do
    get member_members_quit_url
    assert_response :success
  end

end
