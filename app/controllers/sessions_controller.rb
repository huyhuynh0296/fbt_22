class SessionsController < ApplicationController
  def new; end
<<<<<<< HEAD
=======

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == Settings.session.remember ? remember(user) : forget(user)
      redirect_to user
    else
      flash_error
    end
  end

  def destroy
    log_out if is_loged_in?
    redirect_to root_url
  end

  private

  def flash_error
    flash.now[:danger] = t "session.app.error"
    render :new
  end
>>>>>>> a5f22ce... signup-login-logout
end
