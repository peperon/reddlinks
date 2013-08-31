require 'test_helper'

class CommunitiesControllerTest < ActionController::TestCase
  setup do
    @community = communities(:one)

    session[:user_id] = users(:one).id
    @input_fields = {
      title: "NewCommunity",
      description: "",
      user_id: users(:one).id
    }
    @link = links(:google)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:communities)
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

  test "should create community" do
    assert_difference('Community.count') do
      post :create, community: @input_fields
    end

    assert_redirected_to community_path(assigns(:community))
  end

  test "should show community" do
    get :show, id: @community
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @community
    assert_response :success
  end

  test "should update community" do
    put :update, id: @community, community: @input_fields
    assert_redirected_to community_path(assigns(:community))
  end

  test "should destroy community" do
    assert_difference('Community.count', -1) do
      delete :destroy, id: @community
    end

    assert_redirected_to communities_path
  end

  test "should get not related page" do
    get :not_related, link_id: @link
    assert_response :success
    assert_not_nil assigns(:link)
    assert_not_nil assigns(:communities)
  end
end
