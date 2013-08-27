require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  fixtures :links

  test "links attributes must not be empty" do
    link = Link.new

    assert link.invalid?
    assert link.errors[:title].any?
    assert link.errors[:url].any?
  end

  test "link title must be unique" do
    link = Link.new(title:        links(:google).title,
                    description:  "Description",
                    url:          "http://google.com")

    assert !link.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'),
                 link.errors[:title].join('; ')
  end
end
