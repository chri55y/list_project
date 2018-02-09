require 'test_helper'

class ListUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get list_users_index_url
    assert_response :success
  end

  test "should get show" do
    get list_users_show_url
    assert_response :success
  end

  test "should get new" do
    get list_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get list_users_edit_url
    assert_response :success
  end

  test "should get delete" do
    get list_users_delete_url
    assert_response :success
  end

end
