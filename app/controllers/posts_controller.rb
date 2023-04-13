class PostsController < ApplicationController
  load_and_authorize_resource
  
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
    @post = Post.new(post_params.merge(author: current_user))

    respond_to do |format|
      if @post.save
        @post.update_posts_counter(current_user.id)
        format.html do
          redirect_to user_path(current_user), notice: 'Post was successfully created.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    respond_to do |f|
      f.html do
        if @post.destroy
          @post.update_posts_counter(params[:user_id])
          flash[:success] = 'Deleted'
          redirect_to user_path(params[:user_id])
        else
          flash.now[:error] = 'Post could not be deleted'
          render :show, status: :unprocessable_entity, locals: { post: }
        end
      end
    end
  end

  private

  def post_params
    @user = current_user
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
