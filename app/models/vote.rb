class Vote < ActiveRecord::Base
  attr_accessible :link_id, :user_id, :value

  belongs_to :link
  belongs_to :user

  def self.elect(user_id, link_id, value)
    vote = Vote.find_by_user_id_and_link_id user_id, link_id

    if vote.nil?
      vote = Vote.create(user_id: user_id,
                  link_id: link_id,
                  value: value)
    else
      vote.value = value
    end
    vote.save
  end
end
