Rails.application.routes.draw do


  get 'welcome/index'
  root 'welcome#index'

  


  resources :users do
  	resources :addresses 
  	resources :payments do
 		resources :bank_infos
 		resources :credit_cards
 	end
  end
  resources :jobs
  get 'jobs/myjob'
  resources :job_types
  resources :profiles
  resources :clients
  resources :teenagers

  
end
