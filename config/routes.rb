Rails.application.routes.draw do
  resources :books
  resources :categories
  mount Ckeditor::Engine => '/ckeditor'
  mount Notifications::Engine => "/notifications"

  get '/search' => 'pages#search', :as => 'search_page'
  get 'pages/quiz'
  get 'pages/about'
  get 'pages/gallery'
  get 'pages/help'
  get 'pages/payment'
  get 'pages/covid'
  resources :profiles
  get 'certificate/index'
  get 'requests/update'
  resources :credits
  authenticate :user, lambda { |u| u.user_role == "admin" } do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  resources :replies
  resources :homepage
  resources :favorites, only: [:index, :destroy, :create, :show]
  resources :completes, only: [:create, :destroy]

  get 'comments/create'
  get 'course/assesment'
  get 'welcome/index'
  get 'exam/assesment'
  get 'users/index'
  get 'report', to: 'favorites#report', as: 'report'
  get 'all_favorite', to: 'favorites#all_favorite', as: 'all_favorite'
  get 'instructor', to: 'users#instructor', as: 'instructor'
  get 'professional', to: 'users#professional', as: 'professional'
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


  root to: "homepage#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
