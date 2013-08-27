class LinkCommunity < ActiveRecord::Base
  attr_accessible :community_id, :link_id

  belongs_to :comminity
  belongs_to :link
end
