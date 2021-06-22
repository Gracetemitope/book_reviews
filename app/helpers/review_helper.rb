module ReviewHelper
  def show_comments
    content = ''
    @review.comments.each do |comment|
      content << content_tag(:div, class: 'card mt-3 p-2 comment') do
        concat content_tag(:p, comment.user.name, class: 'fw-bolder')
        concat content_tag(:p, comment.content)
        concat content_tag(:span, comment.created_at.strftime("%Y/%m/%d"))
      end
    end
    content.html_safe
  end
end
