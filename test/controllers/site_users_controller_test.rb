require 'test_helper'

class SiteUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @site_user = site_users(:one)
  end

  test "should get index" do
    get site_users_url
    assert_response :success
  end

  test "should get new" do
    get new_site_user_url
    assert_response :success
  end

  test "should create site_user" do
    assert_difference('SiteUser.count') do
      post site_users_url, params: { site_user: { code: @site_user.code, created_at: @site_user.created_at, site_id: @site_user.site_id, updated_at: @site_user.updated_at, user_id: @site_user.user_id } }
    end

    assert_redirected_to site_user_url(SiteUser.last)
  end

  test "should show site_user" do
    get site_user_url(@site_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_site_user_url(@site_user)
    assert_response :success
  end

  test "should update site_user" do
    patch site_user_url(@site_user), params: { site_user: { code: @site_user.code, created_at: @site_user.created_at, site_id: @site_user.site_id, updated_at: @site_user.updated_at, user_id: @site_user.user_id } }
    assert_redirected_to site_user_url(@site_user)
  end

  test "should destroy site_user" do
    assert_difference('SiteUser.count', -1) do
      delete site_user_url(@site_user)
    end

    assert_redirected_to site_users_url
  end
end
