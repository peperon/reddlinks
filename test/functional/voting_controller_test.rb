require 'test_helper'

class VotingControllerTest < ActionController::TestCase
  setup do
    @link = links :google
    @john = users :one

    request.env["HTTP_REFERER"] = root_path
    session[:user_id] = @john.id
  end
  
  test "should be able to up for link" do
    assert_difference ->{ Link.find_by_id(@link.id).rating } do
      post :up, link_id: @link.id 
    end

    assert_redirected_to request.env["HTTP_REFERER"]
  end

  test "should be able to vote down for link" do
    assert_difference -> { Link.find_by_id(@link.id).rating }, -1 do
      post :down, link_id: @link.id
    end

    assert_redirected_to request.env["HTTP_REFERER"]
  end
end
