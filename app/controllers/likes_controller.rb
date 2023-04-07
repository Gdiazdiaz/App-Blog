class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:id])
    @like = @post.likes.new(like_params)
    @like.author = @current_user
    
    respond_to do |format|
      if @like.save
        format.html { redirect_to @post, notice: 'Like was successfully created.'}
      else
        format.html { render :new}
      end
    end
  end

  private

  def user_params
    params.require(:comment).permit(:text)
  end
end
