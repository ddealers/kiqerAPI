require 'test_helper'

class KiqsControllerTest < ActionController::TestCase
  setup do
    @kiq = kiqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kiqs)
  end

  test "should create kiq" do
    assert_difference('Kiq.count') do
      post :create, kiq: { : @kiq., : @kiq. }
    end

    assert_response 201
  end

  test "should show kiq" do
    get :show, id: @kiq
    assert_response :success
  end

  test "should update kiq" do
    put :update, id: @kiq, kiq: { : @kiq., : @kiq. }
    assert_response 204
  end

  test "should destroy kiq" do
    assert_difference('Kiq.count', -1) do
      delete :destroy, id: @kiq
    end

    assert_response 204
  end
end
