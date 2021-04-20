class Api::V1::GameRoomsController < ApplicationController

    def index
        @game_rooms = game_room.all
        render json: @game_rooms
    end

    def show
        @game_room = game_room.find(params[:id])
        render json: @game_room
    end

    def create
        @game_room = game_room.new(game_room_params)
        unless @game_room.save
            render json: { status: 500 }
        else
            render json: {
                status: :added,
                game_room: @game_room
            }
        end
    end

    def update
        if @game_room.update(game_room_params)
            render json: {
                status: :updated,
                game_room: @game_room
            }
        else
            render json: { status: 500 }
        end 
    end

    def destroy
        
        @game_room = game_room.find(params[:id])
        @game_room.destroy
        render json: {}
    end

private

  def game_room_params
    params.require(:game_room).permit(:name)
  end
  
end
