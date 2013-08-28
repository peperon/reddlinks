class LinkCommunitiesController < ApplicationController
  # GET /link_communities
  # GET /link_communities.json
  def index
    @link_communities = LinkCommunity.all
    @link_community.link = Link.find(params[:link_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @link_communities }
    end
  end

  # GET /link_communities/1
  # GET /link_communities/1.json
  def show
    @link_community = LinkCommunity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link_community }
    end
  end

  # GET /link_communities/new
  # GET /link_communities/new.json
  def new
    @link_community = LinkCommunity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link_community }
    end
  end

  # GET /link_communities/1/edit
  def edit
    @link_community = LinkCommunity.find(params[:id])
  end

  # POST /link_communities
  # POST /link_communities.json
  def create
    @link_community = LinkCommunity.new(params[:link_community])

    respond_to do |format|
      if @link_community.save
        format.html { redirect_to @link_community, notice: 'Link community was successfully created.' }
        format.json { render json: @link_community, status: :created, location: @link_community }
      else
        format.html { render action: "new" }
        format.json { render json: @link_community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /link_communities/1
  # PUT /link_communities/1.json
  def update
    @link_community = LinkCommunity.find(params[:id])

    respond_to do |format|
      if @link_community.update_attributes(params[:link_community])
        format.html { redirect_to @link_community, notice: 'Link community was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link_community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_communities/1
  # DELETE /link_communities/1.json
  def destroy
    @link_community = LinkCommunity.find(params[:id])
    @link_community.destroy

    respond_to do |format|
      format.html { redirect_to link_communities_url }
      format.json { head :no_content }
    end
  end
end
