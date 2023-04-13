class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(author: current_user))
    puts @user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(@user, @post), notice: 'Comment was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    respond_to do |f|
      f.html do
        if comment.destroy
          comment.update_comments_counter(params[:post_id])
          flash[:success] = 'Deleted'
          redirect_to user_post_path(params[:user_id], params[:post_id])
        else
          flash.now[:error] = 'Comment could not be deleted'
          render :show, status: :unprocessable_entity, locals: { post: }
        end
      end
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
