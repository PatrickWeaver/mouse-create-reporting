require 'test_helper'

class BadgeUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @badge_user = badge_users(:one)
  end

  test "should get index" do
    get badge_users_url
    assert_response :success
  end

  test "should get new" do
    get new_badge_user_url
    assert_response :success
  end

  test "should create badge_user" do
    assert_difference('BadgeUser.count') do
      post badge_users_url, params: { badge_user: { awarded: @badge_user.awarded, badge_id: @badge_user.badge_id, code: @badge_user.code, created_at: @badge_user.created_at, eligibility_dt: @badge_user.eligibility_dt, evidence_id: @badge_user.evidence_id, issuer_id: @badge_user.issuer_id, requirements: @badge_user.requirements, updated_at: @badge_user.updated_at, user_id: @badge_user.user_id } }
    end

    assert_redirected_to badge_user_url(BadgeUser.last)
  end

  test "should show badge_user" do
    get badge_user_url(@badge_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_badge_user_url(@badge_user)
    assert_response :success
  end

  test "should update badge_user" do
    patch badge_user_url(@badge_user), params: { badge_user: { awarded: @badge_user.awarded, badge_id: @badge_user.badge_id, code: @badge_user.code, created_at: @badge_user.created_at, eligibility_dt: @badge_user.eligibility_dt, evidence_id: @badge_user.evidence_id, issuer_id: @badge_user.issuer_id, requirements: @badge_user.requirements, updated_at: @badge_user.updated_at, user_id: @badge_user.user_id } }
    assert_redirected_to badge_user_url(@badge_user)
  end

  test "should destroy badge_user" do
    assert_difference('BadgeUser.count', -1) do
      delete badge_user_url(@badge_user)
    end

    assert_redirected_to badge_users_url
  end
end
