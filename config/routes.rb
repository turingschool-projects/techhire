Rails.application.routes.draw do
  root "static_pages#home"
  get "/home", to: "static_pages#home", as: "home"
  get "/learn-more", to: "static_pages#learn_more", as: "learn_more"
  get "/tools-resources", to: "static_pages#tools_resources", as: "tools_resources"
  get "/techhire-locations", to: "static_pages#techhire_locations", as: "techhire_locations"
  get '/admin', to: 'sessions#new', as: 'admin/login'
  post '/admin', to: 'sessions#create'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :companies, only: [:show, :destroy, :update]
  end

  resources :companies, only: [:create]
  get 'signup', to: "companies#new"
end
