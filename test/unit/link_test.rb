require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  setup do
    @facebook = links :facebook
  end

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

  test "link can show onwners name" do
    google = links :google
    john   = users :one
    
    google.user = john

    assert_equal john.name, google.owner_name
  end

  test "link can show last updated date in a friendly format" do
    google          = links :google
    friendly_format = google.updated_at.strftime "%d.%m.%Y"

    assert_equal friendly_format, google.last_updated
  end

  test "link can calculate rating correctly" do
    assert_equal 2, @facebook.rating
  end
end
