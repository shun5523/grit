class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
	  if admin_signed_in?
            admin_top_path

     elsif user_signed_in?
            top_path
      else
        	  root_path
    end
end

def after_sign_up_path_for(resource)
    if user_signed_up?
            top_path
      else
            root_path
    end

end

def after_sign_out_path_for(resource)

        root_path

end



protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :sex])
  end
end



