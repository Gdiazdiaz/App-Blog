class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:id])
    @post = @user.posts.find(params[:id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @current_user
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.'}
      else
        format.html { render :new}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end