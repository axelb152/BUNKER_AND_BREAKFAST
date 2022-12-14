Rails.application.routes.draw do
  # get 'bookings/index'
  # get 'bookings/new'
  # get 'bookings/show'
  # get 'bookings/create'
  # get 'bookings/edit'
  # get 'bookings/update'
  # get 'bookings/destroy'
  # get 'bunkers/index'
  # get 'bunkers/new'
  # get 'bunkers/show'
  # get 'bunkers/create'
  # get 'bunkers/edit'
  # get 'bunkers/update'
  # get 'bunkers/destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }

  root to: "bunkers#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'bunkers/manage', to: 'bunkers#manage'
  get 'bookings/manage', to: 'bookings#manage'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookings
  resources :bunkers
end
