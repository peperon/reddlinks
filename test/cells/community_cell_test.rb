require 'test_helper'

class CommunityCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "h3"
  end
  

end
