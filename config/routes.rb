Rails.application.routes.draw do
  resources :users do
    resources :orders
  end

  root to: 'sessions#index'

  match '/signup',        to: 'users#new',            via: 'get'
  match '/signin',        to: 'sessions#new',         via: 'get'
  match '/signout',       to: 'sessions#destroy',     via: 'delete'
  match '/sunday',        to: 'sessions#sunday',      via: 'get'
  match '/monday',        to: 'sessions#monday',      via: 'get'
  match '/tuesday',       to: 'sessions#tuesday',     via: 'get'
  match '/wednesday',     to: 'sessions#wednesday',   via: 'get'
  match '/thursday',      to: 'sessions#thursday',    via: 'get'
  match '/friday',        to: 'sessions#friday',      via: 'get'
  match '/saturday',      to: 'sessions#saturday',    via: 'get'

  resources :sessions,      only: [:create]
  resources :items

end
