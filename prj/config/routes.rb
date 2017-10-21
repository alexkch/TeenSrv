Rails.application.routes.draw do
 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'payments/index'

  get 'payments/edit'

  get 'payments/show'

  get 'payments/new'

  get 'welcome/index'
  root 'welcome#index'

  get 'jobs/myjob'

  resources :users do
    resources :clients
    resources :endorsements
    resources :teenagers, :name_prefix => "user_"
    resources :profiles
    resources :addresses 
    resources :payments do
       resources :bank_infos
       resources :credit_cards
    end
  end
  resources :jobs
  resources :job_types
  resources :profiles
end
