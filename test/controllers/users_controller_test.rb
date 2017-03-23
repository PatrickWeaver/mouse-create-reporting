require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { created_at: @user.created_at, credly: @user.credly, default_group: @user.default_group, email: @user.email, last_login: @user.last_login, name: @user.name, password: @user.password, remember_token: @user.remember_token, token: @user.token, tos: @user.tos, updated_at: @user.updated_at, username: @user.username, verified_at: @user.verified_at, verified_by: @user.verified_by } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { created_at: @user.created_at, credly: @user.credly, default_group: @user.default_group, email: @user.email, last_login: @user.last_login, name: @user.name, password: @user.password, remember_token: @user.remember_token, token: @user.token, tos: @user.tos, updated_at: @user.updated_at, username: @user.username, verified_at: @user.verified_at, verified_by: @user.verified_by } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
