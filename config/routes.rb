Rails.application.routes.draw do
  
  resources :profiles
  resources :mc_questions
  resources :quizzes
  get 'certificate/index'
  get 'requests/update'
  resources :credits
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :payments
  resources :replies
  resources :homepage
  resources :favorites, only: [:create, :destroy, :index, :show, :certificate]
  get 'comments/create'
  get 'course/assesment'
  get 'welcome/index'
  get 'exam/assesment'
  get 'users/index'
  get 'certificate', to: 'favorites#certificate', as: 'certificate'
  get 'professional', to: 'users#professional', as: 'professional'
  get 'instructor', to: 'users#instructor', as: 'instructor'
  get 'search', to: 'users#search', as: :search


  notify_to :users, with_devise: :users
  notify_to :users
  notify_to :users, controllers: { notifcations: 'users/notifcations' }
  notify_to :admins, with_devise: :users, controller: 'admins/notifications_with_devise'

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
  #mount Rapidfire::Engine => "/rapidfire"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
