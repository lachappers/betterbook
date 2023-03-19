Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "static_pages#home"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: %i[index show] do
    resources :friendships, only: %i[create]
    resources :profiles, only: [:show]
  end

  resources :posts do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]
  resources :profiles
  resources :friendships, only: [:create, :destroy]
  

  resources :static_pages, only: :show
end