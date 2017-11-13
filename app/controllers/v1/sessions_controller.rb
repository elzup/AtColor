module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!
    before_action :authenticate_user_from_token!, only: [:is_auth]

    # POST /v1/register
    def create
      @user = User.new user_params
      unless @user.save
        return render json: {error: @user.errors}, status: :unprocessable_entity
      end
      sign_in :user, @user
      @user.solved(2)
      render json: @user, serializer: SessionSerializer, root: nil
    end

    # POST /v1/login
    def login
      @user = User.find_for_database_authentication(username: user_params[:username])
      unless @user && @user.valid_password?(user_params[:password])
        return render json: @user, status: :unprocessable_entity
      end

      sign_in :user, @user
      render json: @user, serializer: SessionSerializer, root: nil
    end

    # GET /v1/login
    def is_auth
      @current_user.solved(1)
      render json: { message: "Your Authentication OK! \"#{@current_user.username}\"" }
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

