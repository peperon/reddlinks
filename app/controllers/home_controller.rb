class HomeController < ApplicationController
  def index
    @links = Link.order(:title)
  end
end
