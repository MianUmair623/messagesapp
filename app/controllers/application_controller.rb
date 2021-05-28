class ApplicationController < ActionController::Base
	
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email,:password])
  end
	# helper_method :current_user

	# def current_user
	# 	return @current_user if @current_user.present?
	# 	if session[:user_id].present?
	# 		@current_user = User.find(session[user_id])
	# 	else
	# 		@current_user = User.genrate
	# 		session[user_id] = @current_user.id
	# 		@current_user 
	# 	end
	# end
end
