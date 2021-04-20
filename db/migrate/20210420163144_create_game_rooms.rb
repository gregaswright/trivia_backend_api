class CreateGameRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :game_rooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
