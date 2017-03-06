class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])

		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication
			set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
		else
			session["devise.facebook_data"] = request.env["omniauth.auth"]
			redirect_to root_path
		end
	end

	def vkontakte
		@user = User.from_omniauth(request.env["omniauth.auth"])
		
		#binding.pry
		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication
			set_flash_message(:notice, :success, :kind => "VKontakte") if is_navigational_format?
		else
			session["devise.vkontakte_data"] = request.env["omniauth.auth"]
			redirect_to root_path
			
		end
	end

	def after_sign_in_path_for(resource)
	  user_path resource
	end

	def twitter
		#request.env["omniauth.auth"][:info][:email] = params[:email] if params[:email]
		#binding.pry
		#request.env["omniauth.auth"][:info][:email] = ' '
		@user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
		
		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication
			set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?

			
		else
			session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
			redirect_to root_path
		end
	end

	def failure
		redirect_to root_path
	end
end
