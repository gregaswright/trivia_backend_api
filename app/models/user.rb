class User < ApplicationRecord
    has_many :messages
    has_one :user_game_room
    has_one :game_room, through: :messages
    has_one :game_room, through: :user_game_room

    validates_uniqueness_of :username
end
