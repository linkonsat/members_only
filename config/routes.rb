# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  require 'sidekiq/web'

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  root to: 'posts#index'
  resources :user
  resources :posts
  get 'admins/dashboard', to: 'admins#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'all_post', to: 'posts#all_post'
  # Defines the root path route ("/")
  # root "articles#index"
end
