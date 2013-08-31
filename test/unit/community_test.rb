require 'test_helper'

class CommunityTest < ActiveSupport::TestCase
  test "community title and user id must not be empty" do
    community = Community.new

    assert community.invalid?
    assert community.errors[:title].any?
    assert community.errors[:user_id].any?
  end

  test "community title must be one word" do
    community = Community.new
    community.title = "Not separate words"
    community.user_id = 1

    assert community.invalid?
    assert community.errors[:title].any?
  end
end
