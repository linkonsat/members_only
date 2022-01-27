Rails.application.routes.draw do
  root to: 'mainpages#index'
  resources :mainpages
  resources :user
  devise_for :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
