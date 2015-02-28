Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users , controllers: { registrations: 'registrations' }
  resources :users, :path => '/all_users'
  resources :cities
end
