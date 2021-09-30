class MessagesChannel < ApplicationCable::Channel
  def subscribed
    @game_room = GameRoom.find(params[:game_room])
    stream_for @game_room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
