require 'test_helper'

class BadgeProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @badge_project = badge_projects(:one)
  end

  test "should get index" do
    get badge_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_badge_project_url
    assert_response :success
  end

  test "should create badge_project" do
    assert_difference('BadgeProject.count') do
      post badge_projects_url, params: { badge_project: { badge_id: @badge_project.badge_id, created_at: @badge_project.created_at, project_id: @badge_project.project_id, updated_at: @badge_project.updated_at } }
    end

    assert_redirected_to badge_project_url(BadgeProject.last)
  end

  test "should show badge_project" do
    get badge_project_url(@badge_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_badge_project_url(@badge_project)
    assert_response :success
  end

  test "should update badge_project" do
    patch badge_project_url(@badge_project), params: { badge_project: { badge_id: @badge_project.badge_id, created_at: @badge_project.created_at, project_id: @badge_project.project_id, updated_at: @badge_project.updated_at } }
    assert_redirected_to badge_project_url(@badge_project)
  end

  test "should destroy badge_project" do
    assert_difference('BadgeProject.count', -1) do
      delete badge_project_url(@badge_project)
    end

    assert_redirected_to badge_projects_url
  end
end
