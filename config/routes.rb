Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :payments
  resources :replies
  resources :homepage
  get 'comments/create'
  get 'course/assesment'
  get 'welcome/index'
  get 'exam/assesment'
  get 'users/index'
  get 'professional', to: 'users#professional', as: 'professional'
  get 'instructor', to: 'users#instructor', as: 'instructor'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    # Add this
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, :only =>[:show]
resources :courses do
  resources :comments
end

  # devise_for :users
  root to: "courses#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
