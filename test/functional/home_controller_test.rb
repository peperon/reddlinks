require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    @programming = communities :two
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should get filter" do
    get :filter, community: @programming.title
    assert_response :success
    assert_not_nil assigns(:links)
    assert_not_nil assigns(:community)
  end

end
