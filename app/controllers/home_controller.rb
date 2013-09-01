class HomeController < ApplicationController
  def index
    @links = Link.all

    sort_links
  end

  def filter
    @community = Community.find_by_title(params[:community])
    @links = @community.links

    sort_links
    render 'index'
  end

  private
  def sort_links
    if params[:order]
      orderer = OrdererFactory.build params[:order].to_sym
      @links = orderer.order @links
    end
  end
end
