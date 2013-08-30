require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get login" do
    get :new
    assert_response :success
  end

  test "should login successuly with valid username and password" do
    john = users(:one)
    post :create, name: john.name, password: "abv123"

    assert_redirected_to root_path
    assert_equal john.id, session[:user_id]
  end

  test "should fail to login with invalid username and password" do
    post :create, name: "Unknown", password: "invalid"

    assert_redirected_to login_url
    assert_equal "Invalid username/password", flash[:alert]
  end

  test "should be able to logoff" do
    session[:user_id] = :id

    delete :destroy
    
    assert_nil session[:user_id]
    assert_redirected_to root_path
  end
end
