Rails.application.routes.draw do

  devise_for :users

  root 'users#profile'

  get '/users/users_friends' => 'users#users_friends', as: '/friends'

  get 'messages/inbox' => 'messages#inbox'
  get 'messages/outbox' => 'messages#outbox'

  post 'messages/new' => 'messages#new'
  post 'paintings/new' => 'paintings#new'

  resources :users, :messages, :paintings, :friendships, :categories

  resources :reports do
    resources :comments
  end



end
