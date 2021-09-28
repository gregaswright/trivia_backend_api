class MessageSerializer < ActiveModel::Serializer
  attributes :id, :game_room_id, :content, :created_at
  belongs_to :game_room
end
