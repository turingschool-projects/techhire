Rails.application.routes.draw do
  get '/admin', to: 'sessions#new', as: 'admin/login'
  post '/admin', to: 'sessions#create'

  namespace :admins do
    resources :dashboard, only: [:index]
  end

  root "home#index"
  resources :home, only: [:index, :edit, :update]
  resources :learn_more, only: [:index, :edit, :update]
  resources :tools_resources, only: [:index, :edit, :update]
  resources :companies, only: [:create]
  get 'signup', to: "companies#new"
end
