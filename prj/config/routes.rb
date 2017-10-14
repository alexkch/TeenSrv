Rails.application.routes.draw do
  get 'welcome/index'

  resources :users
  resources :profiles
  resources :clients
  resources :teenagers

  # resources :profiles
  
  root 'welcome#index'
end
