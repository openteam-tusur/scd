Rails.application.routes.draw do
  root :to => 'landing#welcome'
  resources :claims, only: :create
end