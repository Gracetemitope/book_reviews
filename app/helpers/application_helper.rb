module ApplicationHelper
  def vote_or_unvote_btn(review)
    vote = Vote.find_by(review: review, user: current_user)
    if vote
      link_to('Unvote!', reviews_path(id: vote.id, review_id: review.id), method: :delete)
    else
      link_to('Vote!', reviews_path(review_id: review.id), method: :post)
    end
  end

  def all_categories
    Category.order('priority ASC')
  end

  def category_links(categories)
    content = ''
    categories.each do |category|
      content << content_tag(:li, class: 'nav-item') do
        link_to(category.name, category_path(category), class: 'nav-link fw-bolder')
      end
    end
    content.html_safe
  end
end
