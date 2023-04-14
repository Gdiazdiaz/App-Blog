      class Api::CommentsController < Api::ApiController
        
        def index
          @post = Post.find(params[:post_id])
          @comments = @post.comments.order(created_at: :desc)
          render json: @comments
        end

        def create
            @user = User.find(params[:user_id])
            @post = @user.posts.find(params[:post_id])
            @comment = @post.comments.new(comment_params.merge(author: @current_user))
            puts @user
        
              if @comment.save
                render json: @comment, status: :created
              else
                render json: {error: @comment.errors.full_messages},
                status: :unprocessable_entity
              end
            end

            private

  def comment_params
    params.require(:comment).permit(:text)
  end

      end