require 'test_helper'

class RefDataLoadsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_data_loads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_data_load" do
    assert_difference('RefDataLoad.count') do
      post :create, :ref_data_load => { }
    end

    assert_redirected_to ref_data_load_path(assigns(:ref_data_load))
  end

  test "should show ref_data_load" do
    get :show, :id => ref_data_loads(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ref_data_loads(:one).to_param
    assert_response :success
  end

  test "should update ref_data_load" do
    put :update, :id => ref_data_loads(:one).to_param, :ref_data_load => { }
    assert_redirected_to ref_data_load_path(assigns(:ref_data_load))
  end

  test "should destroy ref_data_load" do
    assert_difference('RefDataLoad.count', -1) do
      delete :destroy, :id => ref_data_loads(:one).to_param
    end

    assert_redirected_to ref_data_loads_path
  end
end
