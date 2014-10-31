Rails.application.routes.draw do
  root to: "static_pages#home"

  resources :users do
    resources :friendships, only: [:index]
  end

  resources :courses do
    resources :cards
  end

  resources :enrollments, only: [:create, :destroy]

  resource :session, only: [:new, :create, :destroy]

  resources :user_card_histories, only: [:create, :update, :destroy]

  resources :friendships, only: [:create, :destroy]

  resources :comments, except: [:index, :new]

  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'
  
  
  namespace :api, :defaults => { :format => :json } do
    resources :users do
      resources :friendships, only: [:index]
    end
    resources :courses do
      resources :cards, except: [:new, :edit]
    end
    resources :enrollments, only: [:create, :destroy]
    resource :session, only: [:create, :destroy]
    resources :user_card_histories, only: [:create, :update, :destroy]
    resources :friendships, only: [:create, :destroy]
    resources :comments, except: [:index, :new, :edit]
  end
end
