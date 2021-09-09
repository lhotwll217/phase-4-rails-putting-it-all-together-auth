class SessionsController < ApplicationController

    def destroy 
        if session[:user_id]
        session.delete :user_id
        head :no_content
        else
            render json: {errors: ["Unauthorized", nil]}, status: :unauthorized
        end
    end

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: ["Invalid username or password", nil]}, status: :unauthorized
        end
    end
end
