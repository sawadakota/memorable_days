Rails.application.routes.draw do
  devise_for :users
  resources :users do
    collection do
      get 'search'
    end
    member do
      get 'follows'
      get 'friend'
    end
    resources :memories, only: [:new, :create, :edit, :update] do
      resources :comments, only: [:create]
      collection do
        get 'search'
        get 'add_tag_friend'
      end
    end
    resources :friendships, only: [:create, :destroy]
  end
  get "/users/:id/memories/:memory_id/search" => "memories#search"
  root "users#index"
end
