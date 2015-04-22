Rails.application.routes.draw do
  root "static_pages#home"
  get "/home", to: "static_pages#home", as: "home"
  get "/learn_more", to: "static_pages#learn_more", as: "learn_more"
  get "/tools_resources", to: "static_pages#tools_resources", as: "tools_resources"
  get "/locations", to: "static_pages#locations", as: "locations"
  resources :companies, only: [:create]
  get 'signup', to: "companies#new"
end
