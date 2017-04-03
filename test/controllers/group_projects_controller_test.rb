require 'test_helper'

class GroupProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_project = group_projects(:one)
  end

  test "should get index" do
    get group_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_group_project_url
    assert_response :success
  end

  test "should create group_project" do
    assert_difference('GroupProject.count') do
      post group_projects_url, params: { group_project: { created_at: @group_project.created_at, group_id: @group_project.group_id, order: @group_project.order, project_id: @group_project.project_id, updated_at: @group_project.updated_at } }
    end

    assert_redirected_to group_project_url(GroupProject.last)
  end

  test "should show group_project" do
    get group_project_url(@group_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_project_url(@group_project)
    assert_response :success
  end

  test "should update group_project" do
    patch group_project_url(@group_project), params: { group_project: { created_at: @group_project.created_at, group_id: @group_project.group_id, order: @group_project.order, project_id: @group_project.project_id, updated_at: @group_project.updated_at } }
    assert_redirected_to group_project_url(@group_project)
  end

  test "should destroy group_project" do
    assert_difference('GroupProject.count', -1) do
      delete group_project_url(@group_project)
    end

    assert_redirected_to group_projects_url
  end
end
