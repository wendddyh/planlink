Rails.application.routes.draw do
  resources :profiles
  # get 'review/new'
  # get 'attendance/show'
  # get 'attendance/index'
  # get 'venue/show'
  # get 'venue/index'
  # get 'events/new'
  # get 'events/update'
  # get 'events/index'
  # get 'events/show'
  resources :venues do
    resources :bookings
    resources :events do
      resources :attendances, only: [:create, :new]
    end
    resources :reviews, only: [:create, :new]

  end

  resources :attendances, only: [:update, :index]
  resources :friend_requests


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "pages#home"
  get 'events/index', to: 'events#index', as:'myevent_list'
  get 'pages/show', to: 'pages#show', as:'front_page'
  get 'booking/index', to: 'bookings#index', as: 'booking_listing_path'

  # patch 'attendances/update', to: 'attendances#update', as: 'update_page'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
