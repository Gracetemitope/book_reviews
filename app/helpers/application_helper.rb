module ApplicationHelper
  def flash_message
    if flash[:notice]
      content_tag(:div, flash[:notice], class: 'alert alert-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'alert alert-danger')
    end
  end

  # def vote_or_unvote_btn(review)
  #   vote = Vote.find_by(review: review, user: current_user)
  #   if vote
  #     link_to('Unvote!', reviews_path(id: vote.id, review_id: review.id), method: :delete)
  #   else
  #     link_to('Vote!', reviews_path(review_id: review.id), method: :post)
  #   end
  # end

  def featured_img(img)
    "background-image: linear-gradient(to bottom, rgba(11, 11, 13, 0.3), rgba(0, 0, 0, 0.923)), url('#{img}')"
  end

  def featured_review
    return if @featured.nil?

    render 'featured'
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
