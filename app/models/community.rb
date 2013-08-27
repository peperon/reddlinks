class Community < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, presence: true
  validates :title, uniqueness: true

  has_many :link_communities

  before_destroy :ensure_not_referenced_by_any_link_comminity

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
