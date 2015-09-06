Rails.application.routes.draw do

  devise_for :users
  root "static_pages#show", name: "Home"
  get "/home", to: "static_pages#show", as: "home", name: "Home"
  get "/learn_more", to: "static_pages#show", as: "learn_more", name: "Learn More"
  get "/tools_resources", to: "static_pages#show", as: "tools_resources", name: "Tools and Resources"
  get "/techhire_locations", to: "static_pages#show", as: "techhire_locations", name: "TechHire Locations"

  get "/companies/welcome", to: "companies#welcome", as: "welcome"
  get 'signup', to: "companies#new", as: :signup

  resources :case_studies, only: [:show]

  namespace :admin do
    resources :users
    get   "/static_pages/:name", to: "static_pages#edit",  as: :static_pages
    put   "/static_pages/:name", to: "static_pages#update"
    patch "/static_pages/:name", to: "static_pages#update"

    resources :dashboard, only: [:index]
    get "/dashboard/cms-instructions", to: "dashboard#cms_instructions", as: "cms_instructions"
    resources :contents, only: [:index, :update, :edit, :show]
    resources :pdfs
    resources :techhire_locations
    resources :csv_uploads, only: [:new, :create]
    resources :companies, except: [:create] do
      resources :notes, only: [:index, :create, :destroy]
    end
  end

  resources :companies, only: [:create, :show, :update]

  get 'employer_stage1/:id', to: "companies#stage1", as: "stage1"
  get 'employer_stage2/:id', to: "companies#stage2"
  get 'employer_stage3/:id', to: "companies#stage3"

  patch 'employer_stage2/:id', to: "companies#stage2", as: "stage2"
  patch 'employer_stage3/:id', to: "companies#stage3", as: "stage3"
  patch "/employer_finished/:id", to: "companies#finished", as: "finished"

  resources :pdfs, only: [:show]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
