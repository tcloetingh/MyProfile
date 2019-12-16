class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.react 
    where(subtitle: 'REACT')
  end

  scope :ror_filter, -> {where(subtitle: 'Ruby on Rails')}
end
