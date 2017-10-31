module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: :index

    # GET
    # Index users
    def index
      @users = User.all
      render json: @users, each_serializer: V1::UserSerializer, root: nil
    end

    private

    def user_params
      params.permit(:username, :password)
    end
  end
end
