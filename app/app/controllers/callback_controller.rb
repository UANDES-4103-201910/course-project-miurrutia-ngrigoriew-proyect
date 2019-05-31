class CallbacksController < Devise::OmniauthCallbacksController
	def google_oauth2
		#@user = User.from_omniauth(request.env["omniauth.auth"])
		#sign_in_and_redirect @user
		#render json: {user: @user}
      # You need to implement the method below in your model (e.g. app/models/user.rb)

		@user = User.from_omniauth (request.env[ 'omniauth.auth'])
		sign_in_and_redirect @user
	end

end