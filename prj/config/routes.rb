Rails.application.routes.draw do
  get 'welcome/index'

  resources :users do
  	resources :addresses
  end
  resources :profiles
  resources :clients
  resources :teenagers

  root 'welcome#index'
end
