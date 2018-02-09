require 'test_helper'

class ListItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get list_items_index,_url
    assert_response :success
  end

  test "should get show," do
    get list_items_show,_url
    assert_response :success
  end

  test "should get new," do
    get list_items_new,_url
    assert_response :success
  end

  test "should get edit," do
    get list_items_edit,_url
    assert_response :success
  end

  test "should get delete" do
    get list_items_delete_url
    assert_response :success
  end

end
