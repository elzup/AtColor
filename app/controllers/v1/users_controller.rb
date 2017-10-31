module V1
  class UsersController < ApplicationController

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
