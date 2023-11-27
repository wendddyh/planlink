Rails.application.routes.draw do
  get 'review/new'
  get 'attendance/show'
  get 'attendance/index'
  get 'venue/show'
  get 'venue/index'
  get 'events/new'
  get 'events/update'
  get 'events/index'
  get 'events/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
