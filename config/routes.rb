Rails.application.routes.draw do

  resources :persons
  resources :imports
  devise_for :users
   root to: "dashboard#index"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


end
