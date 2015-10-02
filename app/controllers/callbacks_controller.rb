class CallbacksController < ApplicationController
  def index
    omniauth_data = request.env['omniauth.auth']
    user          = User.find_from_omniauth(omniauth_data)
    unless user
      user          = User.create_from_omniauth(omniauth_data)
      session[:user_id] = user.id
    end
      session[:user_id] = user.id
      # render json: omniauth_data
    redirect_to root_path, notice: "Thank you for signing in"
    # # render json: env["omniauth.auth"].to_json
  end
end
