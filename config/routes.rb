Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => 'landing#welcome'
  resources :claims, only: [:new, :create]
end