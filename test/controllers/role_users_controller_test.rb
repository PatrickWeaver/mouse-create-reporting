require 'test_helper'

class RoleUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role_user = role_users(:one)
  end

  test "should get index" do
    get role_users_url
    assert_response :success
  end

  test "should get new" do
    get new_role_user_url
    assert_response :success
  end

  test "should create role_user" do
    assert_difference('RoleUser.count') do
      post role_users_url, params: { role_user: { id: @role_user.id, role_id: @role_user.role_id, user_id: @role_user.user_id } }
    end

    assert_redirected_to role_user_url(RoleUser.last)
  end

  test "should show role_user" do
    get role_user_url(@role_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_role_user_url(@role_user)
    assert_response :success
  end

  test "should update role_user" do
    patch role_user_url(@role_user), params: { role_user: { id: @role_user.id, role_id: @role_user.role_id, user_id: @role_user.user_id } }
    assert_redirected_to role_user_url(@role_user)
  end

  test "should destroy role_user" do
    assert_difference('RoleUser.count', -1) do
      delete role_user_url(@role_user)
    end

    assert_redirected_to role_users_url
  end
end
