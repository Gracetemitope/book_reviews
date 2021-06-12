class VotesController < ApplicationController

  # GET /votes or /votes.json
  def index
    @votes = Vote.all
  end

  def create
    @vote = current_user.votes.new(review_id: params[:review_id])

    if @like.save
      redirect_to reviews_path, notice: 'You voted a review.'
    else
      redirect_to reviews_path, alert: 'You cannot vote this review.'
    end
  end

  def destroy
    @vote = Vote.find_by(id: params[:id], user: current_user, review_id: params[:review_id])
    if like
      like.destroy
      redirect_to reviews_path, notice: 'You unvote a review.'
    else
      redirect_to reviews_path, alert: 'You cannot unvote review.'
    end
  end
end
