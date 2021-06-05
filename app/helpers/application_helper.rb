module ApplicationHelper
  def vote_or_unvote_btn(review)
    vote = Vote.find_by(review: review, user: current_user)
    if vote
      link_to('Unvote!', review_vote_path(id: vote.id, review_id: review.id), method: :delete)
    else
      link_to('Vote!', review_votes_path(review_id: review.id), method: :post)
    end
  end
end
