class SessionsController < ApplicationController
  def new
  end

  def destroy
    #set user_id to nil when logged out
    session[:user_id] = nil
    redirect_to '/login'
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user
     #save user id as a session cookie
      session[:user_id] = user.id
      #redirect to home page upon sucessful login
      redirect_to '/'
    else
      #redirect to login page if something failed
      redirect_to '/login'
  end

end
