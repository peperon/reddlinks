require 'test_helper'

class LinkCommunitiesControllerTest < ActionController::TestCase
  fixtures :all

  setup do
    @link_community = link_communities(:one)
  end

  test "should create relation between link and community" do
    assert_difference('LinkCommunity.count') do
      post :create, link_community: { community_id: @link_community.community_id, link_id: @link_community.link_id }
    end
    success_message = "#{@link_community.link.title} is now part of the #{@link_community.community.title}"

    assert_redirected_to new_communities_to_link_path(@link_community.link_id)
    assert_equal success_message, flash[:notice]
  end

  test "should destroy link_community" do
    assert_difference('LinkCommunity.count', -1) do
      delete :destroy, id: @link_community
    end

    assert_redirected_to link_path(@link_community.link)
    assert_equal "Successfully removed the community", flash[:notice]
  end
end
