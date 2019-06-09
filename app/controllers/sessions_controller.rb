class SessionsController < ApplicationController
  skip_before_action :get_current_user 

  def create
    auth = Authentication.new
    auth.start_session(session_params)
    if auth.allowed?
      render json: auth.token, status: :created #We should have a method to render in the application_controller too, like save_and_render...
    else
      render json: auth.errors, status: :unauthorized #We should have a method to render in the application_controller too, like save_and_render...  
    end
  end

  def destroy 
    token = nil
    authenticate_with_http_token do |key, options|
      token = Token.find_by(secret: key)
      if token
        render_ok token.destroy #Here we are ussing a method in the application_controller...
      end  
    end   
    render json: {errors: "invalid token"}, status: :bad_request unless token
  end

  private
  def session_params
    params.permit(:email, :username, :password)
  end
end
