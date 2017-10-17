Rails.application.routes.draw do
  get 'payment/index'

  get 'payment/new'

  get 'payment/create'

  get 'welcome/index'

  resources :users
  resources :profiles
  resources :clients
  resources :teenagers

  root 'welcome#index'
end
