class PagesController < ApplicationController
  def home
    @skills = Skills.all
  end

  def about
  end

  def contact
  end
end
