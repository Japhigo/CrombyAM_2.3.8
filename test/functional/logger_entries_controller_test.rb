require 'test_helper'

class LoggerEntriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logger_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logger_entry" do
    assert_difference('LoggerEntry.count') do
      post :create, :logger_entry => { }
    end

    assert_redirected_to logger_entry_path(assigns(:logger_entry))
  end

  test "should show logger_entry" do
    get :show, :id => logger_entries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => logger_entries(:one).to_param
    assert_response :success
  end

  test "should update logger_entry" do
    put :update, :id => logger_entries(:one).to_param, :logger_entry => { }
    assert_redirected_to logger_entry_path(assigns(:logger_entry))
  end

  test "should destroy logger_entry" do
    assert_difference('LoggerEntry.count', -1) do
      delete :destroy, :id => logger_entries(:one).to_param
    end

    assert_redirected_to logger_entries_path
  end
end
