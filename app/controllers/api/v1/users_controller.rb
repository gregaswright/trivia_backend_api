class Api::V1::UsersController < ApplicationController

    def index
        @users = user.all
        render json: @users
    end

    def show
        @user = user.find(params[:id])
        render json: @user
    end

    def create
        @user = user.new(user_params)
        unless @user.save
            render json: { status: 500 }
        else
            render json: {
                status: :added,
                user: @user
            }
        end
    end

    def update
        if @user.update(user_params)
            render json: {
                status: :updated,
                user: @user
            }
        else
            render json: { status: 500 }
        end 
    end

    def destroy
        
        @user = user.find(params[:id])
        @user.destroy
        render json: {}
    end

private

  def user_params
    params.require(:user).permit(:username, :ready)
  end

end
