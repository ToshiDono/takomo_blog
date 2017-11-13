Rails.application.routes.draw do
  resources :articles

  scope module: :articles do
    resources :blogs, only: [:show]
    resources :feeds, only: [:index]
  end

  resources :articles do
    resources :comments
  end

  devise_for :user
  root 'home#index'
end
