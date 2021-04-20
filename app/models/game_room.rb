class GameRoom < ApplicationRecord
    has_many :messages, class_name: "message", foreign_key: "reference_id"
    has_many :users, through: :messages, source: :join_association_table_foreign_key_to_users_table
end
