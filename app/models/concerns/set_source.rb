module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    session[:setsource] = params[:q] if params[:q]
  end
end 