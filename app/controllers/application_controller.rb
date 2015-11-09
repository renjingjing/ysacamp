class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
  @current_user ||= User.find_by_id session[:user_id]
  end
  helper_method :current_user
  # adding a `helper_method` call in here makes the method accessible in the
  # view files in addition to the controllers that inherit from this controller

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?

  def authenticate_user!
    redirect_to new_session_path, alert: "Please sign in" unless user_signed_in?
  end

  def admin_user!
    if user_signed_in?
      redirect_to root_path, alert: "Can't Access!" unless current_user.admin
    else
      redirect_to root_path, alert: "Can't Access!"
    end
  end

  def admin_user?
    current_user.admin == true
  end
  
  helper_method :admin_user?
end
