require 'test_helper'

class CommunityCellTest < Cell::TestCase
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
