module ApplicationHelper
  def nav_bar
    content_tag(:ul, class: "nav navbar-nav") do
      yield
    end
  end
  
  def nav_link(text, path)
    options = current_page?(path) ? { class: "btn btn-secondary" } : { class: "btn btn" }
    content_tag(:li, options) do
      link_to text, path
    end
  end
end
