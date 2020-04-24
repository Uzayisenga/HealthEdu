Rails.application.routes.draw do
  get 'certificate/index'
  get 'requests/update'
  resources :credits
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :payments
  resources :replies
  resources :homepage
  resources :favorites, only: [:create, :destroy, :index]
  get 'comments/create'
  get 'course/assesment'
  get 'welcome/index'
  get 'exam/assesment'
  get 'users/index'
  get 'professional', to: 'users#professional', as: 'professional'
  get 'instructor', to: 'users#instructor', as: 'instructor'
  get 'search', to: 'users#search', as: :search
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    # Add this
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, :only =>[:show, :index]
resources :courses do
  resources :comments
end

  # devise_for :users
<<<<<<< HEAD
  root to: "homepage#index"
=======
  root to: "welcome#index"
>>>>>>> 99a331aa1dd742f9ee23a1873856735e230ec8f3
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
