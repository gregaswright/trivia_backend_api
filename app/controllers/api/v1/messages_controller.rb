class Api::V1::MessagesController < ApplicationController

    def index
        @messages = message.all
        render json: @messages
    end

    def show
        @message = message.find(params[:id])
        render json: @message
    end

    def create
        @message = message.new(message_params)
        unless @message.save
            render json: { status: 500 }
        else
            render json: {
                status: :added,
                message: @message
            }
        end
    end

    def update
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
        
        @message = message.find(params[:id])
        @message.destroy
        render json: {}
    end

private

  def message_params
    params.require(:message).permit(:content, :game_room_id, :user_id)
  end

end
