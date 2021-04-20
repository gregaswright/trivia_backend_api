Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages
      resources :user_game_rooms
      resources :game_rooms
      resources :users, only: [:create, :destroy]
    end
  end
end
