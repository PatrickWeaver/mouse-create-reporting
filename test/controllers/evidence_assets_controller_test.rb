require 'test_helper'

class EvidenceAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidence_asset = evidence_assets(:one)
  end

  test "should get index" do
    get evidence_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_evidence_asset_url
    assert_response :success
  end

  test "should create evidence_asset" do
    assert_difference('EvidenceAsset.count') do
      post evidence_assets_url, params: { evidence_asset: { content: @evidence_asset.content, created_at: @evidence_asset.created_at, evidence_id: @evidence_asset.evidence_id, order: @evidence_asset.order, step_id: @evidence_asset.step_id, step_order: @evidence_asset.step_order, type_id: @evidence_asset.type_id, updated_at: @evidence_asset.updated_at } }
    end

    assert_redirected_to evidence_asset_url(EvidenceAsset.last)
  end

  test "should show evidence_asset" do
    get evidence_asset_url(@evidence_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidence_asset_url(@evidence_asset)
    assert_response :success
  end

  test "should update evidence_asset" do
    patch evidence_asset_url(@evidence_asset), params: { evidence_asset: { content: @evidence_asset.content, created_at: @evidence_asset.created_at, evidence_id: @evidence_asset.evidence_id, order: @evidence_asset.order, step_id: @evidence_asset.step_id, step_order: @evidence_asset.step_order, type_id: @evidence_asset.type_id, updated_at: @evidence_asset.updated_at } }
    assert_redirected_to evidence_asset_url(@evidence_asset)
  end

  test "should destroy evidence_asset" do
    assert_difference('EvidenceAsset.count', -1) do
      delete evidence_asset_url(@evidence_asset)
    end

    assert_redirected_to evidence_assets_url
  end
end
