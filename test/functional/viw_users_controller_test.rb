require 'test_helper'

class ViwUsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:viw_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create viw_user" do
    assert_difference('ViwUser.count') do
      post :create, :viw_user => { }
    end

    assert_redirected_to viw_user_path(assigns(:viw_user))
  end

  test "should show viw_user" do
    get :show, :id => viw_users(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => viw_users(:one).to_param
    assert_response :success
  end

  test "should update viw_user" do
    put :update, :id => viw_users(:one).to_param, :viw_user => { }
    assert_redirected_to viw_user_path(assigns(:viw_user))
  end

  test "should destroy viw_user" do
    assert_difference('ViwUser.count', -1) do
      delete :destroy, :id => viw_users(:one).to_param
    end

    assert_redirected_to viw_users_path
  end
end
