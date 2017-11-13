module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]

    # GET
    # Index users
    def index
      @users = User.all
      render json: @users, each_serializer: V1::UserSerializer
    end

    def show
      @user = User.find(params[:id])
      render json: @user, serializer: V1::UserSerializer
    end

    def update
      unless @current_user.update(user_update_params)
        return render json: {error: @current_user.errors}, status: :unprocessable_entity
      end
      render json: @current_user, serializer: V1::UserSerializer, root: nil
    end

    def delete
      unless @current_user.update(user_update_params)
        return render json: {error: @current_user.errors}, status: :unprocessable_entity
      end
      render json: @current_user, serializer: V1::UserSerializer, root: nil
    end

    private
  end
end
