class Community < ActiveRecord::Base
  NO_WITESPACES = /^[\S]+$/

  attr_accessible :description, :title, :user_id

  validates :title, :user_id, presence: true
  validates :title, uniqueness: true
  validates :title, format: { :with => NO_WITESPACES }

  belongs_to :user
  has_many :link_communities

  before_destroy :ensure_not_referenced_by_any_link_comminity

  def not_related_to_a(link)
    link_communities.none? { |reference| reference.link_id == link.id } 
  end

  def links
    link_communities.map(&:link)
  end

  private

  def ensure_not_referenced_by_any_link_comminity
    if link_communities.empty?
      true
    else
      errors.add(:base, 'Link reference present')
      false
    end
  end
end
