module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    # POST /v1/login
    def create
      if User.exists?(username: user_params[:username])
        @user = User.find_for_database_authentication(username: params[:username])
        unless @user.valid_password?(params[:passwordj])
          # error
        end
      else
        @user = User.new user_params
        unless @user.save!
          return render json: {error: 'ユーザを作成することが出来ませんでした。'}, status: :unprocessable_entity
        end
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

