require "test_helper"

class OrderFactoryTest < ActiveSupport::TestCase
  test "should be able to create right classes" do
    assert_equal NewOrderer, OrdererFactory.build(:new).class
    assert_equal OldOrderer, OrdererFactory.build(:old).class
    assert_equal TopOrderer, OrdererFactory.build(:top).class
  end
end
