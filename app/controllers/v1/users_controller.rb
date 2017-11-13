module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index]

    # GET
    # Index users
    def index
      @users = User.all
      render json: @users, each_serializer: V1::UserSerializer
    end

    def show
      @user = User.find(params[:id])
      if @current_user.id == @user.id
        @current_user.solved(1)
      end
      render json: @user, serializer: V1::UserSerializer
    end

    def update
      if @current_user.update(user_update_params)
        if !user_update_params[:twitter].nil? || !user_update_params[:language].nil?
          @current_user.solved(3)
        end
        render json: @current_user, serializer: V1::UserSerializer, root: nil
      else
        render json: {error: @current_user.errors}, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:username, :password, :twitter, :language)
    end

    def user_update_params
      params.permit(:twitter, :language)
    end
  end
end
