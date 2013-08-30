require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @input_attributes = { 
      name:                  "John",
      password:              "password",
      password_confirmation: "password"
    }
    @input_with_password_difference = {
      name:                  "Michel",
      password:              "passoword",
      password_confirmation: "different_password",
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @input_attributes
    end

    assert_redirected_to root_path
  end

  test "should not create user with password difference" do
    assert_no_difference('User.count') do
      post :create, user: @input_with_password_difference
    end

    assert_response 200
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
