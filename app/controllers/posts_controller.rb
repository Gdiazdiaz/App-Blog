class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = ApplicationController.current_user(@user.id).posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_path(ApplicationController.current_user(@user.id)), notice: 'Post was successfully created.'}
      else
        format.html { render :new}
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
