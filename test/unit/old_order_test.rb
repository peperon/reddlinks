require 'test_helper'

class OldOrdererTest < ActiveSupport::TestCase
  setup do
    @links = [
      build_link_with_id_and_creation_date(1, 2.day.ago),
      build_link_with_id_and_creation_date(2, 3.day.ago),
      build_link_with_id_and_creation_date(3, 1.day.ago),
    ]
  end

  test "orderer should sort links view old created" do
    orderer = OldOrderer.new
    ordered = orderer.order @links

    assert_equal 2, ordered[0].id
    assert_equal 1, ordered[1].id
    assert_equal 3, ordered[2].id
  end
end
