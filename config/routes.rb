Rails.application.routes.draw do
  resources :users

  root to: 'users#index'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  resources :sessions,      only: [:create]
  resources :items

end
