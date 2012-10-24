class SessionsController < ApplicationController
  skip_before_filter :require_current_user
  
  def new
    
  end
  def create
    email = 
    user = User.find_by_email(params[:email])
    if user
      flash[:notice] = "Logged In!"
      set_current_user(user.id)
      redirect_to root_path
    else
      flash[:notice] = "No user found with that email"
      redirect_to root_path
    end
  end
  def destroy
    logout_current_user
    flash[:notice] = "Logged out"
    redirect_to new_sessions_path
  end
end
