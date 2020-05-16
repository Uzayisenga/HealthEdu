Rails.application.routes.draw do
  get 'pages/quiz'
  get 'pages/about'
  resources :profiles
  get 'certificate/index'
  get 'requests/update'
  resources :credits
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :replies
  resources :homepage
  resources :favorites, only: [:create, :destroy, :index, :show]
  get 'comments/create'
  get 'course/assesment'
  get 'welcome/index'
  get 'exam/assesment'
  get 'users/index'
  get 'professional', to: 'users#professional', as: 'professional'
  get 'instructor', to: 'users#instructor', as: 'instructor'
  get 'search', to: 'users#search', as: :search
  get 'quiz', to: 'users#quiz', as: 'quiz'
 
  devise_for :users, controllers: {
    registrations: "users/registrations",
    # Add this
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, :only =>[:show, :index]
resources :courses do
  collection do
    get :all_course
  end
  resources :comments do
    resources :replies
  end
end

  # devise_for :users
  root to: "homepage#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
