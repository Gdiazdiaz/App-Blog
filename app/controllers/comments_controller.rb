class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(author: ApplicationController.current_user(@user.id)))
    puts @user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(@user, @post), notice: 'Comment was successfully added.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
