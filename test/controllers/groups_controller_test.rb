require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get groups_url
    assert_response :success
  end

  test "should get new" do
    get new_group_url
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post groups_url, params: { group: { code: @group.code, created_at: @group.created_at, created_by: @group.created_by, deleted_at: @group.deleted_at, label: @group.label, name: @group.name, site_id: @group.site_id, tos: @group.tos, updated_at: @group.updated_at } }
    end

    assert_redirected_to group_url(Group.last)
  end

  test "should show group" do
    get group_url(@group)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_url(@group)
    assert_response :success
  end

  test "should update group" do
    patch group_url(@group), params: { group: { code: @group.code, created_at: @group.created_at, created_by: @group.created_by, deleted_at: @group.deleted_at, label: @group.label, name: @group.name, site_id: @group.site_id, tos: @group.tos, updated_at: @group.updated_at } }
    assert_redirected_to group_url(@group)
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end

    assert_redirected_to groups_url
  end
end
