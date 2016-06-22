class CommentsController < ApplicationController
   def index
  end

  def show
  end

  def create
    @comment = Comment.new(body: params[:comment][:body], user_id: current_user.id, beer_id: params[:comment][:beer_id])
    if @comment.save
        flash[:notice] = "Drink another Beer, you've earned it!"
        redirect_to beer_path(@comment.beer_id)
    else
        flash[:alert] = "Wait, what happend?"
        redirect_to new_comments_path
    end
    
  end

  def update
     @comment = Comment.find(params[:id])
     @comment.update(body: params[:comment][:body])
     redirect_to beer_path(@comment.beer_id)
  end

  def edit
     @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to beer_path(@comment.beer_id)
    end
  end


end
