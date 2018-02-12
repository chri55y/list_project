require 'test_helper'

class ListHierarchyRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get list_hierarchy_relationships_index_url
    assert_response :success
  end

  test "should get show" do
    get list_hierarchy_relationships_show_url
    assert_response :success
  end

  test "should get new" do
    get list_hierarchy_relationships_new_url
    assert_response :success
  end

  test "should get edit" do
    get list_hierarchy_relationships_edit_url
    assert_response :success
  end

  test "should get delete" do
    get list_hierarchy_relationships_delete_url
    assert_response :success
  end

end
