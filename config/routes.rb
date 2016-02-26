Rails.application.routes.draw do
  root :to => 'landing#welcome'
  resources :claims, only: [:new, :create]
end