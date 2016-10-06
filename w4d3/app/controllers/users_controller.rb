class UsersController < ApplicationController
  before_filter :validate_current_user, only: :new

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      msg = UserMailer.welcome_email(@user)
      msg.deliver

      login!(@user)
      @user.save
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :email)
  end
end
