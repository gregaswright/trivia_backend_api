class GameRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_rooms_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
