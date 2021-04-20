class Api::V1::UserGameRoomsController < ApplicationController
    
    def index
        @user_game_rooms = user_game_room.all
        render json: @user_game_rooms
    end

    def show
        @user_game_room = user_game_room.find(params[:id])
        render json: @user_game_room
    end

    def create
        @user_game_room = user_game_room.new(user_game_room_params)
        unless @user_game_room.save
            render json: { status: 500 }
        else
            render json: {
                status: :added,
                user_game_room: @user_game_room
            }
        end
    end

    def update
        if @user_game_room.update(user_game_room_params)
            render json: {
                status: :updated,
                user_game_room: @user_game_room
            }
        else
            render json: { status: 500 }
        end 
    end

    def destroy
        
        @user_game_room = user_game_room.find(params[:id])
        @user_game_room.destroy
        render json: {}
    end

private

  def user_game_room_params
    params.require(:user_game_room).permit(:correct_answers, :game_room_id, :user_id)
  end

end
