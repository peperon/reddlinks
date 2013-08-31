class CommunityCell < Cell::Rails

  def show
    @communities = Community.all
    render
  end

end
