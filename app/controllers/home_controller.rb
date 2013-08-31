class HomeController < ApplicationController
  def index
    community_id = params[:community_id]
    if community_id
      @links = Link.all.find_all { |c| c.link_communities.any? { |l| l.community_id == community_id.to_i } }
    else
      @links = Link.order(:title)
    end
  end
end
