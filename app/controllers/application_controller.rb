class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def authenticate_admin!
    raise SecurityError unless current_user.try(:admin?)
  end

  rescue_from SecurityError do
    redirect_back(fallback_location: root_path, notice: "Not for you!")
  end


end
