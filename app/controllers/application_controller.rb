class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DefaultPageContent
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
end
