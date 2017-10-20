Rails.application.routes.draw do
  get 'payments/index'


  get 'welcome/index'
  root 'welcome#index'

  resources :users do
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
  resources :jobs
  get 'jobs/myjob'
  resources :job_types
  resources :clients
end
