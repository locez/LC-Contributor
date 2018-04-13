require 'rouge/plugins/redcarpet'
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Linux CN 原创投稿平台"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def markdown(text)
      options ={
          :autolink =>true,
          :space_after_headers => true,
          :fenced_code_blocks => true,
          :no_intra_emphasis => true,
          :strikethrough => true,
          :tables => true
          
      }
      markdown = Redcarpet::Markdown.new(HtmlWithRouge,options)
      markdown.render(text).html_safe
  end

  class HtmlWithRouge < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet 
  end
end
