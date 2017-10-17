Rails.application.routes.draw do
  get 'payments/index'

  get 'payments/edit'

  get 'payments/show'

  get 'payments/new'

  get 'welcome/index'
  root 'welcome#index'

  get 'jobs/myjob'


  resources :users do
  	resources :addresses
    resources :profiles
    resources :teenagers
  end
  resources :jobs
  resources :job_types
  #resources :profiles
  resources :clients
  #resources :teenagers

  
end
