class BeersController < ApplicationController
   def index
  	@beers = Beer.all.order("created_at DESC")
    @user = User.new
    @profile = current_user
  end

  def show
  	@beer = Beer.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(beer_id: @beer.id)
  end


 

  def update
  end
end
