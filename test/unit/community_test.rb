require 'test_helper'

class CommunityTest < ActiveSupport::TestCase
  setup do
    @programming = communities :two    
  end

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

  test "community should be able to return list of related links" do
    assert_equal 3, @programming.links.size
  end

  test "community should be abel to check if it is related to a link" do
    link = links :gmail

    assert @programming.not_related? link
  end
end
