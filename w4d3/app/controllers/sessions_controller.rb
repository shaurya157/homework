class SessionsController < ApplicationController
before_filter :validate_current_user, only: :new
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params[:user_name], session_params[:password])

    if user.nil?
      flash.now[:errors] = ['Invalid credentials']
      render :new
    else
      session[:session_token] = user.session_token
      redirect_to cats_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:user_name, :password)
  end
end
