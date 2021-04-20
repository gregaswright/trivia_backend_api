User.destroy_all
GameRoom.destroy_all
UserGameRoom.destroy_all
Message.destroy_all

User.create(username: "Bilbo", ready: false)
User.create(username: "Frodo", ready: false)

GameRoom.create(name: "The Shire")

UserGameRoom.create(correct_answers: 0, game_room_id: 1, user_id: 1)
UserGameRoom.create(correct_answers: 0, game_room_id: 1, user_id: 2)

Message.create(content: "My precious!", game_room_id: 1, user_id: 1)
Message.create(content: "NO! My precious!", game_room_id: 1, user_id: 2)