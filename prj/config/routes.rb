Rails.application.routes.draw do

  # ROOT
  root 'home#index' 


  # Registration Devise Route
  devise_for :users, :controllers => {:registrations => "users/registrations"}


  # Home Routes  
  get 'home/index'
  get 'welcome/index' 

  # Search Routes
  get 'search', to: 'search#search', as: 'search'

  get 'job_types/index', to: 'job_types#index', as: 'job_types'
  # JOB Routes
  resources :jobs
  resources :job_types
  resources :offer_jobs
  resources :apply_jobs
  resources :accept_jobs
  resources :cancel_jobs
  get 'jobs/clientjobs', to: 'jobs#clientjobs', as: 'clientjobs'
  get 'jobs/:id/recommended_teens', to: 'jobs#recommended_teens', as: 'recommended_teens'


  #resources :sessions

  resources :charges
  # Routes
  resources :users, only: [:index, :show, :destroy] do
    resources :transactions
    resources :clients
    resources :endorsements
    resources :ratings
    resources :teenagers, :name_prefix => "user_"
    resources :addresses 
	
	get 'payments/index', to: 'payments#index', as: 'paymentsindex'
	
    resources :payments do
       resources :bank_infos
       resources :credit_cards
    end
  end

  resources :teenagers do
    resources :skills, :name_prefix => "teenager_"
  end

  resources :transactions
  resources :profiles
end