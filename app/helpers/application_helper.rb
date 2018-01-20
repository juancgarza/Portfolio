module ApplicationHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet

    def block_code(code, language)
      Rouge.highlight(code, language || 'text', 'html')
    end
  end

  def login_helper style= ''
     if current_user.is_a?(GuestUser)
       (link_to 'Register', new_user_registration_path , class: style) +
       " ".html_safe +
       (link_to 'Login', new_user_session_path, class: style)
     else
     link_to 'Logout', destroy_user_session_path , method: :delete , class: style
     end
  end

  def nav_items_list
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_me_path,
        title: "About Me"
      },
      {
        url: contact_path,
        title: "Contact"
      },
      {
        url: blogs_path,
        title: "Blog"
      },
      {
        url: projects_path,
        title: "Portfolio"
      }
    ]
  end
  def nav_helper style ,tag_type
    nav_links = ''
    nav_items_list.each do |item|
      a =  "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{nav_active? item[:url]}'>#{item[:title]}</a </#{tag_type}>"
      nav_links << a
    end
    nav_links.html_safe
  end

  def nav_active? path
    "active" if current_page? path
  end

  def markdown(text)
      options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" }
      }

      extensions = {
        autolink:           true,
        highlight:          true,
        superscript:        true,
        disable_indented_code_blocks: true,
        space_after_headers: true,
        fenced_code_blocks: true
      }

      #renderer = Redcarpet::Render::HTML.new(options)
      renderer = HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end
end
