require 'test_helper'

class NewOrdererTest < ActiveSupport::TestCase
  setup do
    @links = [
      build_link_with_id_and_creation_date(1, 5.day.ago),
      build_link_with_id_and_creation_date(2, 4.day.ago),
      build_link_with_id_and_creation_date(3, 2.day.ago),
    ]
  end

  test "orderer should sort links view new created" do
    orderer = NewOrderer.new
    ordered = orderer.order @links

    assert_equal 3, ordered[0].id
    assert_equal 2, ordered[1].id
    assert_equal 1, ordered[2].id
  end
end
