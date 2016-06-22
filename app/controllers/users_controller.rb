class UsersController < ApplicationController
  
  def index	
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new

  end

  
  def create
  	# puts params.inspect
		@user = User.new(user_params)
    flash[:notice] = "Successfully Logged In"
		if @user.save
      session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to beers_path
  	end
  end

  def update
    @user= User.find(params[:id])
    @user.update(user_params)
      redirect_to edit_user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  def edit
  	puts params.inspect
  	@user = User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
