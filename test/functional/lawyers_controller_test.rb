require 'test_helper'

class LawyersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lawyers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lawyer" do
    assert_difference('Lawyer.count') do
      post :create, :lawyer => { }
    end

    assert_redirected_to lawyer_path(assigns(:lawyer))
  end

  test "should show lawyer" do
    get :show, :id => lawyers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => lawyers(:one).to_param
    assert_response :success
  end

  test "should update lawyer" do
    put :update, :id => lawyers(:one).to_param, :lawyer => { }
    assert_redirected_to lawyer_path(assigns(:lawyer))
  end

  test "should destroy lawyer" do
    assert_difference('Lawyer.count', -1) do
      delete :destroy, :id => lawyers(:one).to_param
    end

    assert_redirected_to lawyers_path
  end
end
