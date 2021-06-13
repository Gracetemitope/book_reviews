class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, only: %i[vote]

  def vote
    if Vote.exists?(user_id: @current_user.id, review_id: params[:id])
      flash[:alert] = 'You cannot vote a review twice'
    else
      vote = @current_user.votes.build(review_id: params[:id])

      if vote.save
        flash[:notice] = 'You voted a review'
      else
        flash[:alert] = @review.errors
      end
    end

    redirect_to review_path
  end
end
