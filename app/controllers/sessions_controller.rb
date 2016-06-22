class SessionsController < ApplicationController
 
  def new 
    if current_user
      redirect_to @current_user
    end
  end
    
  def create
    puts "in cREATE THE EMAIL ISSSSS"
    puts params[:session][:email]
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.password == params[:session][:password]
      session[:user_id] = @user.id  
      flash[:notice] = "Successfully Logged In"
      redirect_to beers_path
    else
      flash[:alert] = "Not Logged In"
      redirect_to login_path
    end
  end

  def destroy
     session[:user_id] = nil
     redirect_to login_path
  end
end


