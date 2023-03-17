Rails.application.routes.draw do
  get 'profiles/new'
  get 'profiles/create'
  get 'profiles/show'
  get 'profiles/index'
  get 'profiles/edit'
  get 'profiles/update'
  get 'profiles/destroy'
  get 'like/create'
  get 'like/destroy'
  get 'comments/index'
  get 'comments/show'
  get 'comments/create'
  get 'comments/new'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  get 'posts/index'
  get 'posts/show'
  get 'posts/create'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  get 'static_pages/root'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static_pages#root"
end
