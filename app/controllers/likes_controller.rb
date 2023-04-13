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
        @like.update_likes_counter(@post.id)
        format.html { redirect_to user_post_path(@user, @post), notice: 'Like was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    like = Like.find(params[:id])
    respond_to do |f|
      f.html do
        if like.destroy
          like.update_likes_counter(params[:post_id])
          flash[:success] = 'Deleted'
          redirect_to user_post_path(params[:user_id], params[:post_id])
        else
          flash.now[:error] = 'Like could not be deleted'
          render :show, status: :unprocessable_entity, locals: { post: }
        end
      end
    end
  end
end
