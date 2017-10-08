Rails.application.routes.draw do
  get 'welcome/index'

  resources :users do
  	resources :profiles
  end

  root 'welcome#index'
end