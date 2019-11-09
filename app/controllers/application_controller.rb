class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
	if admin_signed_in?
	    admin_top_path
	 else
	 	top_path
	 end
end

def after_sign_up_path_for(resource)
	if admin_signed_up?
	    admin_top_path
	 else
	 	top_path
	 end
end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :sex])
  end
end
