module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    # POST /v1/register
    def create
      @user = User.new user_params
      unless @user.save
        return render json: {error: @user.errors}, status: :unprocessable_entity
      end
      sign_in :user, @user
      render json: @user, serializer: SessionSerializer, root: nil
    end

    # POST /v1/login
    def login
      @user = User.find_for_database_authentication(username: user_params[:username])
      unless @user.valid_password?(user_params[:password])
        return render json: @user, status: :unprocessable_entity
      end

      sign_in :user, @user
      render json: @user, serializer: SessionSerializer, root: nil
    end

    private

    def invalid_login
      warden.custom_failure!
      render json: {error: '不正なログインです。'}
    end

    def user_params
      params.permit(:username, :password)
    end
  end
end

