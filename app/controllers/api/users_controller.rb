      class Api::UsersController < Api::ApiController

        def index
          @users = User.all.order(created_at: :desc)
          render json: @users, status: :ok
        end

        def show
            @user = User.find(params[:id])
            render json: @user, status: :ok
        end
      end