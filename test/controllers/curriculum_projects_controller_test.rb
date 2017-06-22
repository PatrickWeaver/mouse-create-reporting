require 'test_helper'

class CurriculumProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curriculum_project = curriculum_projects(:one)
  end

  test "should get index" do
    get curriculum_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_curriculum_project_url
    assert_response :success
  end

  test "should create curriculum_project" do
    assert_difference('CurriculumProject.count') do
      post curriculum_projects_url, params: { curriculum_project: { created_at: @curriculum_project.created_at, curriculum_id: @curriculum_project.curriculum_id, order: @curriculum_project.order, project_id: @curriculum_project.project_id, updated_at: @curriculum_project.updated_at } }
    end

    assert_redirected_to curriculum_project_url(CurriculumProject.last)
  end

  test "should show curriculum_project" do
    get curriculum_project_url(@curriculum_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_curriculum_project_url(@curriculum_project)
    assert_response :success
  end

  test "should update curriculum_project" do
    patch curriculum_project_url(@curriculum_project), params: { curriculum_project: { created_at: @curriculum_project.created_at, curriculum_id: @curriculum_project.curriculum_id, order: @curriculum_project.order, project_id: @curriculum_project.project_id, updated_at: @curriculum_project.updated_at } }
    assert_redirected_to curriculum_project_url(@curriculum_project)
  end

  test "should destroy curriculum_project" do
    assert_difference('CurriculumProject.count', -1) do
      delete curriculum_project_url(@curriculum_project)
    end

    assert_redirected_to curriculum_projects_url
  end
end
