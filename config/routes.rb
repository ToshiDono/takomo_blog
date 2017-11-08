Rails.application.routes.draw do
  devise_for :user
  root 'home#index'
end
