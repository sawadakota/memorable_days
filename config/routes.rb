Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'search'
    end
    resources :memories, only: [:new, :create, :edit, :update] do
      collection do
        get 'search'
        get 'add_tag_friend'
      end
    end
    resources :friendships, only: [:create, :destroy]
  end
  root "users#index"
end