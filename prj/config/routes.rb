Rails.application.routes.draw do

  # ROOT
  root 'home#index'

  # Registration Devise Route
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}

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
  resources :finished_jobs
  get 'job/clientjobs', to: 'jobs#clientjobs', as: 'clientjobs'
  get 'job/:id/recommended_teens', to: 'jobs#recommended_teens', as: 'recommended_teens'
  get 'profile/:user_id', to: 'profiles#this_profile', as: 'this_profile'

  resources :charges
  resources :admin, only: [:index]
  # Routes
  resources :users, only: [:index, :show, :destroy] do
    resources :transactions
    resources :clients, only: [:index, :show, :edit, :update, :destroy]
    resources :endorsements, only: [:create, :update, :destroy]
    resources :teenagers, :name_prefix => "user_", only: [:index, :show, :edit, :update, :destroy]

	  get 'payments/index', to: 'payments#index', as: 'paymentsindex'

    member do
         post :pay
         post :subscribe
    end
  end

  resources :teenagers do
    resources :skills, :name_prefix => "teenager_"
  end

  get '/users/connect_stripe' => 'users#connect_stripe' 

  # Stripe Connect endpoints
  #  - oauth flow
  get '/connect/oauth' => 'stripe#oauth', as: 'stripe_oauth'
  get '/connect/confirm' => 'stripe#confirm', as: 'stripe_confirm'
  get '/connect/deauthorize' => 'stripe#deauthorize', as: 'stripe_deauthorize'
  #  - create accounts
  post '/connect/managed' => 'stripe#managed', as: 'stripe_managed'
  post '/connect/standalone' => 'stripe#standalone', as: 'stripe_standalone'

  # Stripe webhooks
  post '/hooks/stripe' => 'hooks#stripe'
end
