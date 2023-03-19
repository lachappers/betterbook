Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "static_pages#root"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: %i[index show] do
    resources :friendships, only: %i[create]
  end

  resources :posts do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]
  resources :profiles, only: :show
  resources :friendships, only: [:create, :destroy]
  

  resource :static_pages, only: :show
end
