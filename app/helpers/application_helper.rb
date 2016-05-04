module ApplicationHelper
  def form_group_tag(error, &block)
    css_class = 'form-group'
    css_class << ' has-error' if error.any?
    content_tag :div, capture(&block), class: css_class
  end
end
