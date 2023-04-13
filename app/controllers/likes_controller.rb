class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(author: current_user)

    respond_to do |format|
      if @like.save
        format.html { redirect_to user_post_path(@user, @post), notice: 'Like was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end
end
