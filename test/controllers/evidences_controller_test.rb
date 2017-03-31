require 'test_helper'

class EvidencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidence = evidences(:one)
  end

  test "should get index" do
    get evidences_url
    assert_response :success
  end

  test "should get new" do
    get new_evidence_url
    assert_response :success
  end

  test "should create evidence" do
    assert_difference('Evidence.count') do
      post evidences_url, params: { evidence: { created_at: @evidence.created_at, created_at: @evidence.created_at, deleted_at: @evidence.deleted_at, group_id: @evidence.group_id, project_id: @evidence.project_id, reviewed: @evidence.reviewed, reviewed_at: @evidence.reviewed_at, status: @evidence.status, submitted_at: @evidence.submitted_at, updated_at: @evidence.updated_at, user_id: @evidence.user_id } }
    end

    assert_redirected_to evidence_url(Evidence.last)
  end

  test "should show evidence" do
    get evidence_url(@evidence)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidence_url(@evidence)
    assert_response :success
  end

  test "should update evidence" do
    patch evidence_url(@evidence), params: { evidence: { created_at: @evidence.created_at, created_at: @evidence.created_at, deleted_at: @evidence.deleted_at, group_id: @evidence.group_id, project_id: @evidence.project_id, reviewed: @evidence.reviewed, reviewed_at: @evidence.reviewed_at, status: @evidence.status, submitted_at: @evidence.submitted_at, updated_at: @evidence.updated_at, user_id: @evidence.user_id } }
    assert_redirected_to evidence_url(@evidence)
  end

  test "should destroy evidence" do
    assert_difference('Evidence.count', -1) do
      delete evidence_url(@evidence)
    end

    assert_redirected_to evidences_url
  end
end
