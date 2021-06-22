class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.review_id = params[:review_id]
    @comment.user = current_user

    if @comment.save
      redirect_to reviews_path, notice: 'Comment was successfully created.'
    else
      redirect_to reviews_path, alert: @comment.errors.full_messages.join('. ').to_s
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :name)
  end
end
