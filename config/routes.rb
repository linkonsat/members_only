# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  require 'sidekiq/web'

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  root to: 'posts#index'
  get 'games/snake', to: 'games#snake'
  resources :likes
  resources :user
  resources :posts
  resources :game_profiles
  resources :game_statistics
  resources :user_games
  resources :games 
  resources :game_categories
  resources :all_games
  resources :comments
  resources :messages
  post '/likes/new', to: 'likes#new'
  get 'admins/dashboard', to: 'admins#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'all_post', to: 'posts#all_post'
  # Defines the root path route ("/")
  # root "articles#index"
end
