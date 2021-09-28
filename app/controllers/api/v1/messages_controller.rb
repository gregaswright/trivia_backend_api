class Api::V1::MessagesController < ApplicationController

    def index
        @messages = Message.all
        render json: @messages
    end

    def show
        @message = Message.find(params[:id])
        render json: @message
    end

    def create
        @message = Message.new(message_params)
        game_room = GameRoom.find(message_params[:game_room_id])
        if @message.save
            serialized_data = ActiveModelSerializers::Adapter::Json.new(
                MessageSerializer.new(@message)
            ).serialized_hash
            MessagesChannel.broadcast_to game_room, serialized_data
            head :ok
        end
    end

    def update
        @message = Message.find(params[:id])
        if @message.update(message_params)
            render json: {
                status: :updated,
                message: @message
            }
        else
            render json: { status: 500 }
        end 
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        render json: {}
    end

private

  def message_params
    params.require(:message).permit(:content, :game_room_id, :user_id)
  end

end
