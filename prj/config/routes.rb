Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'jobs/myjob'


  resources :users do
  	resources :addresses
  end
  resources :jobs
  resources :job_types
  resources :profiles
  resources :clients
  resources :teenagers

  
end
