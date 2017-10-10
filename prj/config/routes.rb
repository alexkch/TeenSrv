Rails.application.routes.draw do
  get 'welcome/index'

  resources :users
  resources :profiles
  

  root 'welcome#index'
end