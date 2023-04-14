      class Api::PostsController < Api::ApiController

        def index
          @user = User.find(params[:user_id])
          @posts = @user.posts.order(created_at: :desc)
          render json: @posts
        end

        def show
          @user = User.find(params[:user_id])
          @post = @user.posts.find(params[:id])
          render json: @post, status: :ok
      end
      end