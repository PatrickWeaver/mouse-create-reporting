require 'test_helper'

class EvidenceUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidence_user = evidence_users(:one)
  end

  test "should get index" do
    get evidence_users_url
    assert_response :success
  end

  test "should get new" do
    get new_evidence_user_url
    assert_response :success
  end

  test "should create evidence_user" do
    assert_difference('EvidenceUser.count') do
      post evidence_users_url, params: { evidence_user: { created_at: @evidence_user.created_at, evidence_id: @evidence_user.evidence_id, updated_at: @evidence_user.updated_at, user_id: @evidence_user.user_id } }
    end

    assert_redirected_to evidence_user_url(EvidenceUser.last)
  end

  test "should show evidence_user" do
    get evidence_user_url(@evidence_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidence_user_url(@evidence_user)
    assert_response :success
  end

  test "should update evidence_user" do
    patch evidence_user_url(@evidence_user), params: { evidence_user: { created_at: @evidence_user.created_at, evidence_id: @evidence_user.evidence_id, updated_at: @evidence_user.updated_at, user_id: @evidence_user.user_id } }
    assert_redirected_to evidence_user_url(@evidence_user)
  end

  test "should destroy evidence_user" do
    assert_difference('EvidenceUser.count', -1) do
      delete evidence_user_url(@evidence_user)
    end

    assert_redirected_to evidence_users_url
  end
end
