require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @john   = users :one
    @google = links :google
  end

  test "users attributes must not be empty" do
    user = User.new

    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:password_digest].any?
  end

  test "user name must be unique" do
    user = User.new(name:            users(:one).name,
                    password_digest: "Some random password")

    assert !user.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'),
                 user.errors[:name].join('; ')
  end

  test "user can authenticate with valid username and password" do
    user = User.authenticate "John", "abv123"

    refute_nil user, "Exptect user to not be nil"
  end

  test "user can't authenticate with invalid username" do
    user = User.authenticate "Rob", "password"

    assert_nil user, "Expect user to be nil"
  end

  test "user can't authenticate with invalid password" do
    user = User.authenticate "John", "invalid_password"

    assert_nil user, "Expect user to be nil"
  end

  test "user can vote up for link" do 
    @john.vote_up_for @google.id

    assert_equal 1, @google.rating
  end

  test "user can vote down for link" do
    @john.vote_down_for @google.id

    assert_equal -1, @google.rating
  end
end
