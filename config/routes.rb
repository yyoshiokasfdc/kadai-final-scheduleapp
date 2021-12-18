Rails.application.routes.draw do
  root to: 'schedules#index'    

  get 'signup', to: 'users#new'
  resources :users, only: [:create]
  resources :schedules
end
