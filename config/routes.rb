Rails.application.routes.draw do
  resources :tweets do
    resources :replies

    member do
      post :like
      post :unlike
    end
  end

  resources :users, only: [:edit, :update] do
    member do
      get :tweets
      get :followings
      get :followers
    end
  end

  resources :followships, only: [:create, :destroy]

  root 'tweets#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
