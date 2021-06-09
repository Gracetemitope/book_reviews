class VotesController < ApplicationController
  before_action :set_vote, only: %i[show edit update destroy]

  # GET /votes or /votes.json
  def index
    @votes = Vote.all
  end

  def create
    @vote = current_user.votes.new(review_id: params[:review_id])

    if @like.save
      redirect_to posts_path, notice: 'You voted a post.'
    else
      redirect_to posts_path, alert: 'You cannot like this post.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, post_id: params[:review_id])
    if like
      like.destroy
      redirect_to posts_path, notice: 'You unvote a review.'
    else
      redirect_to reviews_path, alert: 'You cannot unvote review.'
    end
  end
end
