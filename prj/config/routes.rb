Rails.application.routes.draw do
  get 'payment/index'

  get 'payment/new'

  get 'payment/create'

  get 'payments/index'

  get 'payments/edit'

  get 'payments/show'

  get 'payments/new'

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
