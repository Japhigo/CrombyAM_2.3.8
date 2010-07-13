require 'test_helper'

class ContactPointUsageTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_point_usage_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_point_usage_type" do
    assert_difference('ContactPointUsageType.count') do
      post :create, :contact_point_usage_type => { }
    end

    assert_redirected_to contact_point_usage_type_path(assigns(:contact_point_usage_type))
  end

  test "should show contact_point_usage_type" do
    get :show, :id => contact_point_usage_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => contact_point_usage_types(:one).to_param
    assert_response :success
  end

  test "should update contact_point_usage_type" do
    put :update, :id => contact_point_usage_types(:one).to_param, :contact_point_usage_type => { }
    assert_redirected_to contact_point_usage_type_path(assigns(:contact_point_usage_type))
  end

  test "should destroy contact_point_usage_type" do
    assert_difference('ContactPointUsageType.count', -1) do
      delete :destroy, :id => contact_point_usage_types(:one).to_param
    end

    assert_redirected_to contact_point_usage_types_path
  end
end
