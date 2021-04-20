class CreateUserGameRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_game_rooms do |t|
      t.integer :correct_answers
      t.integer :game_room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
