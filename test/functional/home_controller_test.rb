require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    links = links(:google)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

end
