Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  
  resources :users do
  	resources :addresses
  end
  resources :profiles
  resources :clients
  resources :teenagers

  
end
