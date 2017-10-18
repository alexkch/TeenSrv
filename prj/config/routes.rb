Rails.application.routes.draw do
  get 'payments/index'


  get 'welcome/index'
  root 'welcome#index'

  resources :users do
	resources :teenagers
    resources :profiles
  	resources :addresses 
    resources :endorsements
  	resources :payments do
 		resources :bank_infos
 		resources :credit_cards
 	end
  end
  resources :jobs
  get 'jobs/myjob'
  resources :job_types
  resources :clients
end
