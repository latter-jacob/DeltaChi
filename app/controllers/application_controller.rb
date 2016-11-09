class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def visitor!
   if current_user.nil?
     redirect_to root_path
   end
  end

  def admin!
    unless current_user.admin?
      flash[:error] = "You don't rights to access this page"
      redirect_to root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :admin
  end

end
