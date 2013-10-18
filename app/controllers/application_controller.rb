class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :get_anchor_name
  def get_anchor_name title
    title.gsub ' ', '_'
  end

end
