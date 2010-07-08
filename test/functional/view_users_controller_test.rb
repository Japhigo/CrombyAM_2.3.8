require 'test_helper'

class ViewUsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:view_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create view_user" do
    assert_difference('ViewUser.count') do
      post :create, :view_user => { }
    end

    assert_redirected_to view_user_path(assigns(:view_user))
  end

  test "should show view_user" do
    get :show, :id => view_users(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => view_users(:one).to_param
    assert_response :success
  end

  test "should update view_user" do
    put :update, :id => view_users(:one).to_param, :view_user => { }
    assert_redirected_to view_user_path(assigns(:view_user))
  end

  test "should destroy view_user" do
    assert_difference('ViewUser.count', -1) do
      delete :destroy, :id => view_users(:one).to_param
    end

    assert_redirected_to view_users_path
  end
end
