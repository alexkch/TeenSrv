Rails.application.routes.draw do
  get 'welcome/index'

  resources :users
  resources :profiles
  resources :clients
  resources :teenagers

  root 'welcome#index'
end
