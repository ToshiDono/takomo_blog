Rails.application.routes.draw do
  resources :articles

  devise_for :user
  root 'home#index'
end
