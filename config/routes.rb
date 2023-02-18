Rails.application.routes.draw do
  resources :sessions, only: [:edit, :update]
  get "login", to: "sessions#new"
  get "update", to: "users#edit"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :users, except: [:new]
  get "signup", to: "users#new"
  get 'users', to: 'users#index'
  delete '/users/:id', to: 'users#destroy', as: 'delete_user'


  resources :toys
  root 'toys#home'


end
