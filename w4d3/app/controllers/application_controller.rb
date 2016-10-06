class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :auth_token

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def login!(user)
    session[:session_token] = user.session_token
  end

  def validate_current_user
    if current_user
      flash[:errors] = ['You are already logged in!']
      redirect_to cats_url
    end
  end

  def auth_token
    "<input type='hidden'
           name='authenticity_token'
           value='#{form_authenticity_token}'>".html_safe
  end

end
