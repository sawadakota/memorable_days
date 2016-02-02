Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'search'
    end
    resources :memories, only: [:new, :create]
  end
  root "users#index"
end