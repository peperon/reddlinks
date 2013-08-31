class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url, :user_id

  validates :title, :url, :user_id, presence: true
  validates :title, uniqueness: true

  belongs_to :user
  has_many :link_communities, dependent: :destroy
end
