require 'test_helper'

class LinkCommunitiesControllerTest < ActionController::TestCase
  setup do
    @link_community = link_communities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_communities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_community" do
    assert_difference('LinkCommunity.count') do
      post :create, link_community: { community_id: @link_community.community_id, link_id: @link_community.link_id }
    end

    assert_redirected_to link_community_path(assigns(:link_community))
  end

  test "should show link_community" do
    get :show, id: @link_community
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @link_community
    assert_response :success
  end

  test "should update link_community" do
    put :update, id: @link_community, link_community: { community_id: @link_community.community_id, link_id: @link_community.link_id }
    assert_redirected_to link_community_path(assigns(:link_community))
  end

  test "should destroy link_community" do
    assert_difference('LinkCommunity.count', -1) do
      delete :destroy, id: @link_community
    end

    assert_redirected_to link_communities_path
  end
end
