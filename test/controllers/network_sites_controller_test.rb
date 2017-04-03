require 'test_helper'

class NetworkSitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @network_site = network_sites(:one)
  end

  test "should get index" do
    get network_sites_url
    assert_response :success
  end

  test "should get new" do
    get new_network_site_url
    assert_response :success
  end

  test "should create network_site" do
    assert_difference('NetworkSite.count') do
      post network_sites_url, params: { network_site: { network_id: @network_site.network_id, site_id: @network_site.site_id } }
    end

    assert_redirected_to network_site_url(NetworkSite.last)
  end

  test "should show network_site" do
    get network_site_url(@network_site)
    assert_response :success
  end

  test "should get edit" do
    get edit_network_site_url(@network_site)
    assert_response :success
  end

  test "should update network_site" do
    patch network_site_url(@network_site), params: { network_site: { network_id: @network_site.network_id, site_id: @network_site.site_id } }
    assert_redirected_to network_site_url(@network_site)
  end

  test "should destroy network_site" do
    assert_difference('NetworkSite.count', -1) do
      delete network_site_url(@network_site)
    end

    assert_redirected_to network_sites_url
  end
end
