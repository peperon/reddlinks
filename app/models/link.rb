class Link < ActiveRecord::Base
  attr_accessible :description, :title, :url

  validates :title, :url, presence: true
  validates :title, uniqueness: true

  has_many :link_communities, dependent: :destroy
end
