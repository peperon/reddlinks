class LinkCommunitiesController < ApplicationController

  # POST /link_communities
  # POST /link_communities.json
  def create
    @relation = LinkCommunity.new(params[:link_community])

    @relation.save
    success_message = "#{@relation.link.title} is now part of the #{@relation.community.title}"
    
    redirect_to new_communities_to_link_path(@relation.link_id), notice: success_message
  end

  # DELETE /link_communities/1
  # DELETE /link_communities/1.json
  def destroy
    @relation = LinkCommunity.find(params[:id])
    @relation.destroy

    success_message =  "Successfully removed the community"
    
    redirect_to link_path(@relation.link), notice: success_message
  end
end
