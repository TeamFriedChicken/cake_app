require 'test_helper'

class Member::DeliveryAddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_delivery_address_index_url
    assert_response :success
  end

  test "should get create" do
    get member_delivery_address_create_url
    assert_response :success
  end

  test "should get edit" do
    get member_delivery_address_edit_url
    assert_response :success
  end

  test "should get update" do
    get member_delivery_address_update_url
    assert_response :success
  end

  test "should get destroy" do
    get member_delivery_address_destroy_url
    assert_response :success
  end

end
