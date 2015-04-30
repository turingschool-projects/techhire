Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "/home", to: "static_pages#home", as: "home"
  get "/learn-more", to: "static_pages#learn_more", as: "learn_more"
  get "/tools-resources", to: "static_pages#tools_resources", as: "tools_resources"
  get "/techhire-locations", to: "static_pages#techhire_locations", as: "techhire_locations"
  get '/download', to: "static_pages#download", as: "download"

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :companies, only: [:show, :destroy, :update, :index] do
      resources :notes, only: [:index, :create, :destroy]
    end
    resources :pdfs, only: [:create, :new]
    resource :tools_resources, only: [:edit]
  end

  resources :companies, only: [:create]
  resources :pdfs, only: [:show]
  get 'signup', to: "companies#new"
end
