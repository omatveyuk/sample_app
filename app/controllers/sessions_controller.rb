class SessionsController < ApplicationController

  def new
  end

  def create
    logger.debug "Inside session:create"
    
    user = User.find_by(email: params[:session][:email].downcase)
    logger.debug "Got user with #{user.attributes.inspect}"
    logger.debug "Checking if user exists #{user}"
    
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        logger.debug "checking remember_me #{params[:session][:remember_me]}"
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        logger.debug "About to call redirect_back_or"
        redirect_back_or root_url #was user
        logger.debug "Finished call redirect_back_or"
        #redirect_to root_url
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end