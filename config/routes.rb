Rails.application.routes.draw do
  resources :payments
  resources :replies
  get 'comments/create'
  get 'course/assesment'
  get 'welcome/index'
  # get 'users/index'
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
resources :courses do
  resources :comments
end
  
  # devise_for :users
  root to: "courses#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
