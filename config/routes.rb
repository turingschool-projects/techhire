Rails.application.routes.draw do

  devise_for :users
  root "static_pages#home"
  get "/home", to: "static_pages#home", as: "home"
  get "/learn-more", to: "static_pages#learn_more", as: "learn_more"
  get "/tools-resources", to: "static_pages#tools_resources", as: "tools_resources"
  get "/techhire-locations", to: "static_pages#techhire_locations", as: "techhire_locations"
  get '/download', to: "static_pages#download", as: "download"
  get 'signup', to: "companies#new"

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :contents
    resources :videos
    resources :pdfs
    resources :techhire_locations
    resources :companies, except: [:create] do
      resources :notes, only: [:index, :create, :destroy]
    end
    namespace :static_pages do
      get "/home", to: "home", as: "home"
      get "/learn_more", to: "learn_more", as: "learn_more"
      get "/tools_resources", to: "tools_resources", as: "tools_resources"
      get "/techhire_locations", to: "techhire_locations", as: "techhire_locations"
    end
  end

  resources :companies, only: [:create, :show]
  resources :pdfs, only: [:show]
end
