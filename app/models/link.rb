class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url, :user_id

  validates :title, :url, :user_id, presence: true
  validates :title, uniqueness: true

  belongs_to :user
  has_many :link_communities, dependent: :destroy
  has_many :votes, dependent: :destroy

  def owner_name
    user.name
  end

  def last_updated
    updated_at.strftime "%d.%m.%Y"
  end

  def rating
    votes.map(&:value).sum
  end
end
