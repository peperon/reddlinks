require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  setup do
    @google   = links :google
    @facebook = links :facebook
    @john     = users :one
  end

  test "should be able to add new vote" do
    Vote.elect @john.id, @google.id, 1
    vote = Vote.find_by_user_id_and_link_id @john.id, @google.id

    refute_nil vote
  end

  test "should be able to update existing vote" do
    Vote.elect @john.id, @facebook.id, -1
    vote = Vote.find_by_user_id_and_link_id @john.id, @facebook.id

    assert_equal -1, vote.value
  end
end
