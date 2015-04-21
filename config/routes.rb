Rails.application.routes.draw do
  root "home#index"
  resources :home, only: [:index, :edit, :update, :create]
  resources :learn_more, only: [:index, :edit, :update]
  resources :tools_resources, only: [:index, :edit, :update]
  resources :companies, only: [:create]
  get 'signup', to: "companies#new"
end
