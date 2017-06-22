require 'test_helper'

class CurriculasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curricula = curriculas(:one)
  end

  test "should get index" do
    get curriculas_url
    assert_response :success
  end

  test "should get new" do
    get new_curricula_url
    assert_response :success
  end

  test "should create curricula" do
    assert_difference('Curricula.count') do
      post curriculas_url, params: { curricula: { created_at: @curricula.created_at, title: @curricula.title, updated_at: @curricula.updated_at } }
    end

    assert_redirected_to curricula_url(Curricula.last)
  end

  test "should show curricula" do
    get curricula_url(@curricula)
    assert_response :success
  end

  test "should get edit" do
    get edit_curricula_url(@curricula)
    assert_response :success
  end

  test "should update curricula" do
    patch curricula_url(@curricula), params: { curricula: { created_at: @curricula.created_at, title: @curricula.title, updated_at: @curricula.updated_at } }
    assert_redirected_to curricula_url(@curricula)
  end

  test "should destroy curricula" do
    assert_difference('Curricula.count', -1) do
      delete curricula_url(@curricula)
    end

    assert_redirected_to curriculas_url
  end
end
