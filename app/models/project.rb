class Project < ApplicationRecord
  validates_presence_of :title,:body,:main_image,:thumb_image

  def self.angular
    where(subtitle:"Angular")
  end
  scope :ruby_on_rails_project_items, -> {where(subtitle:"Ruby On Rails")}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/100x100"
  end
end
