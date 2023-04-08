class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @comment = @post.comments.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    title = post_params[:title]
  if @user.posts.where(title: title).exists?
    i = 2
    while @user.posts.where(title: "#{title}-#{i}").exists?
      i += 1
    end
    title = "#{title}-#{i}"
  end
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
    title = params[:post][:title]
  if @user.posts.where(title: title).exists?
    i = 2
    while @user.posts.where(title: "#{title}-#{i}").exists?
      i += 1
    end
    title = "#{title}-#{i}"
  end
  params.require(:post).permit(:title, :text).merge(title: title)

  end
end
