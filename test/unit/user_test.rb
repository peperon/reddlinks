require 'test_helper'

class UserTest < ActiveSupport::TestCase
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
end
