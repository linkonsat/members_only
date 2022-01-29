Rails.application.routes.draw do
  devise_for :users
  root to: 'mainpages#index'
  resources :mainpages
  resources :user
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "all_post", to: "posts#all_post"
  # Defines the root path route ("/")
  # root "articles#index"
end
