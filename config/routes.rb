Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "static_pages#home"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: %i[index show] do
    resources :profiles, only: [:show, :edit]
    # resources :friendships
  end

  resources :posts do
    resources :comments, only: [:create]
  end
  resources :likes, only: [:create, :destroy]
  
  resources :profiles, only: [:show, :edit] 
  
  resources :friendships, only: [:destroy, :create, :update]
  
  resources :comments do
    collection do
      post :index
    end
  end

  resources :static_pages, only: :show

  # resource :friendship
  # get 'friendships/destroy/:id', to: 'friendships#destroy', as: 'unfriend'
end