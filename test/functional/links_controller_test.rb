require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  setup do
    @link = links(:google)
    session[:user_id] = users(:one).id
    @input_fields = {
      title: "New link",
      description: "",
      url: "http://some_url.com",
      user_id: users(:one).id
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should not be able to get index if not loged in" do
    session[:user_id] = nil
    get :index
    assert_redirected_to login_path
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link" do
    assert_difference('Link.count') do
      post :create, link: @input_fields
    end

    assert_redirected_to link_path(assigns(:link))
  end

  test "should show link" do
    get :show, id: @link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @link
    assert_response :success
  end

  test "should update link" do
    put :update, id: @link, link: @input_fields
    assert_redirected_to link_path(assigns(:link))
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete :destroy, id: @link
    end

    assert_redirected_to links_path
  end
end
