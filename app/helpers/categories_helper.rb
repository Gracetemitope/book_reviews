module CategoriesHelper

  def categories_display
    content = ''
    @categories.each do |category|
      next if category.reviews.empty?

      content << content_tag(:div, class: 'col-6 col-lg-3 p-0') do
        content_tag(:div, style: featured_img(category.reviews.last.image_url).to_s,
                          class: 'category-img-height background-img position-relative') do
          category_display_name(category) + category_display_link(category)
        end
      end
    end

    content.html_safe
  end

  def category_display_name(category)
    content_tag(:span,
                class: 'category-name position-absolute border-bottom border-3 border-warning fw-bolder pb-1') do
      link_to category.name, category_path(category.id), class: 'text-white text-decoration-none'
    end
  end

  def category_display_link(category)
    content_tag(:span, class: 'category-title position-absolute text-white') do
      link_to category.reviews.last.title, category.reviews.last, class: 'text-white text-decoration-none'
    end
  end

  def show_category
    count_image = 2
    format_ = 'image-first'

    content = ''

    @reviews.each do |review|
      case format_
      when 'image-first'
        content << category_image(review) + review_category(review)

        count_image -= 1
        format_ = 'details-first' if count_image.zero?
      when 'details-first'
        content << review_category(review) + category_image(review)

        count_image += 1
        format_ = 'image-first' if count_image == 2
      end
    end

    content.html_safe
  end

  def category_image(review)
    content_tag(:div, class: 'col-6 col-lg-3 p-0') do
      content_tag(:div, '#', style: featured_img(review.image_url).to_s,
                             class: 'category-img-height background-img position-relative')
    end
  end

  def review_category(review)
    content_tag(:div, class: 'col-6 col-lg-3 p-0 px-3 py-2 bg-light') do
      concat content_tag(:span, review.category.name,
                         class: 'border-bottom border-3 border-warning text-warning primary-color fw-bolder pb-1')

      concat category_title(review)

      concat content_tag(:p, review.text, class: 'text-truncate')

      concat link_to 'vote', "/vote/#{review.id}", class: 'btn primary-bg-color text-white'
    end
  end

  def category_title(review)
    content_tag(:h5, class: 'mt-2') do
      link_to review.title, review, class: 'text-dark text-decoration-none'
    end
  end
end
