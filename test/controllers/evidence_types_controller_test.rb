require 'test_helper'

class EvidenceTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidence_type = evidence_types(:one)
  end

  test "should get index" do
    get evidence_types_url
    assert_response :success
  end

  test "should get new" do
    get new_evidence_type_url
    assert_response :success
  end

  test "should create evidence_type" do
    assert_difference('EvidenceType.count') do
      post evidence_types_url, params: { evidence_type: { active: @evidence_type.active, created_at: @evidence_type.created_at, icon: @evidence_type.icon, messages: @evidence_type.messages, name: @evidence_type.name, updated_at: @evidence_type.updated_at, validation: @evidence_type.validation } }
    end

    assert_redirected_to evidence_type_url(EvidenceType.last)
  end

  test "should show evidence_type" do
    get evidence_type_url(@evidence_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidence_type_url(@evidence_type)
    assert_response :success
  end

  test "should update evidence_type" do
    patch evidence_type_url(@evidence_type), params: { evidence_type: { active: @evidence_type.active, created_at: @evidence_type.created_at, icon: @evidence_type.icon, messages: @evidence_type.messages, name: @evidence_type.name, updated_at: @evidence_type.updated_at, validation: @evidence_type.validation } }
    assert_redirected_to evidence_type_url(@evidence_type)
  end

  test "should destroy evidence_type" do
    assert_difference('EvidenceType.count', -1) do
      delete evidence_type_url(@evidence_type)
    end

    assert_redirected_to evidence_types_url
  end
end
