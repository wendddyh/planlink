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
    resources :events do
      resources :attendances, only: [:create, :new]
    end
    resources :reviews, only: [:create, :new]
    get 'booking_confirmation/show', to: 'bookings#confirmation', as: 'booking_confirmation'
  end

  resources :attendances, only: [:update, :index]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "pages#home"
  get 'events/index', to: 'events#index', as:'myevent_list'


  # patch 'attendances/update', to: 'attendances#update', as: 'update_page'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
