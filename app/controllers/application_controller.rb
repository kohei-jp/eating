class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  add_flash_types :success,:info,:warnig,:danger
  # Bootstrapに対応した success info warning danger 4つのキーが使用できることに
  def current_user
    @current_user||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
    
end
