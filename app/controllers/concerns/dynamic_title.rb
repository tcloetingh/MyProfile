module DynamicTitle
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @dynamic_title = "My Profile | Tyler Cloetingh"
    @seo_keywords = "Tyler Cloetingh Portfolio"
  end
end