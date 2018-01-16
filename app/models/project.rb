class Project < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda {|attrs| attrs['name'].blank?}

  validates_presence_of :title,:body,:main_image,:thumb_image
  include Placeholder

  def self.angular
    where(subtitle:"Angular")
  end

  def self.by_position
    order("position ASC")
  end
  scope :ruby_on_rails_project_items, -> {where(subtitle:"Ruby On Rails")}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height:'600', width:'400')
    self.thumb_image ||= Placeholder.image_generator(height:'100',width:'100')
  end
end
