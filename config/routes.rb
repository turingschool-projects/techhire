Rails.application.routes.draw do
  get '/admin/login' => 'sessions#new'
end
