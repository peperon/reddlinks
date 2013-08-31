class VotingController < ApplicationController
  before_filter :authorize

  def up
    link = params[:link_id]

    current_user.vote_up_for link
    redirect_to root_path
  end

  def down
  link = params[:link_id]

  current_user.vote_down_for link
  redirect_to root_path
  end
end
