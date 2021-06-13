class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, only: %i[vote]

  def vote
    if Vote.exists?(user_id: @current_user.id, review_id: params[:id])
      flash[:alert] = 'You already voted this article'
    else
      vote = @current_user.votes.build(review_id: params[:id])

      if vote.save
        flash[:notice] = 'Review successfully voted'
      else
        flash[:alert] = @review.errors
      end
    end

    redirect_to review_path
  end
end
