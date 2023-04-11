class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes([:author])
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
    @user = ApplicationController.current_user
    @post = @user.posts.new(post_params.merge(author: ApplicationController.current_user))

    respond_to do |format|
      if @post.save
        format.html do
          redirect_to user_path(@user), notice: 'Post was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  private

  def post_params
    title = params[:post][:title]
    title = find_unique_title(title) if @user.posts.where(title:).exists?
    params.require(:post).permit(:title, :text).merge(title:)
  end

  def find_unique_title(title)
    i = 2
    i += 1 while @user.posts.where(title: "#{title}-#{i}").exists?
    "#{title}-#{i}"
  end
end
