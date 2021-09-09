class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
            session[:user_id] = user.id
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end

    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, statue: :created
        else
            render json: {errors: "Unauthorized"}, status: :unauthorized
        end

    end

    



    private

    def user_params
        user_id = session[:user_id]
        params.permit(:username, :image_url, :password, :password_confirmation, :bio, :user_id)
    end
end
