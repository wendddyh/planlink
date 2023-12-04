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
    resources :reviews
  end

  resources :attendances, only: [:update, :index]
  resources :friend_requests

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "pages#home"
  # get 'attendances/show', to: 'attendances#show', as: 'show_page'
  # patch 'attendances/update', to: 'attendances#update', as: 'update_page'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
