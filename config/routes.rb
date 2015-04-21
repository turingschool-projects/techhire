Rails.application.routes.draw do
  get '/admin', to: 'sessions#new', as: 'admin/login'
  post '/admin', to: 'sessions#create'
  namespace :admin do
    resources :dashboard, only: [:index]
  end
end
