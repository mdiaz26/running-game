class Api::V1::UsersController < ApplicationController

    # GET / users
    def index
        users = User.all
        render json: users.to_json(only: [:id, :username, :password])
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(only: [:id, :username, :password])
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render error: {error: 'Unable to create user'}, status: 400
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :id)
    end
end
