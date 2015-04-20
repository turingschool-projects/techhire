Rails.application.routes.draw do
  root "home#index"

  resources :home, only: [:edit, :update]
  get "home", to: "home#index"

  resources :learn_more, only: [:edit, :update]
  get "learn_more", to: "learn_more#index"

  resources :tools_resources, only: [:edit, :update]
  get "tools_resources", to: "tools_resources#index"

  resources :companies, only: [:create]
  get 'signup', to: "companies#new"
end
