Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :memories, only: [:new, :create]
  end
  root "users#index"
end