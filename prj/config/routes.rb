Rails.application.routes.draw do
 
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  get 'welcome/index'
  root 'welcome#index'

  get 'jobs/myjob'

  resources :sessions
  resources :users do
    resources :transactions
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

  resources :teenagers do
    resources :skills, :name_prefix => "teenager_"
  end

  resources :transactions
  resources :jobs
  resources :job_types
  resources :profiles
end
