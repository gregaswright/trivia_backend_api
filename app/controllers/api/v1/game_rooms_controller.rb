class Api::V1::GameRoomsController < ApplicationController

    def index
        @game_rooms = GameRoom.all
        render json: @game_rooms
    end
    
    def show
        @game_room = GameRoom.find(params[:id])
        render json: @game_room
    end

    def create
        @game_room = GameRoom.new(game_room_params)
        if @game_room.save
            @serialized_data = ActiveModelSerializers::Adapter::Json.new(
                GameRoomSerializer.new(@game_room) 
            ).serializable_hash
            ActionCable.server.broadcast 'game_rooms_channel', @serialized_data
            head :ok
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
