class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DefaultPageContent
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include GithubExtract
  before_action :set_copyright

  def set_copyright
    @copyright = JCGRViewTool::Renderer.copyright 'JCGR', 'All rights reserved'
  end
end


module JCGRViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end
