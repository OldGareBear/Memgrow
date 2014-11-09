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

  resources :friendships, only: [:create, :destroy, :update]

  resources :comments, except: [:index, :new]

  get '/auth/facebook/callback', to: 'oauth_callbacks#facebook'

  get 'dashboard' => 'static_pages#dashboard', as: "dashboard"

  namespace :api, defaults: { format: :json } do
    get 'dashboard' => 'static_pages#dashboard', as: "dashboard"
    put 'dashboard' => 'static_pages#update', as: "update_dashboard"
    get '/search' => 'static_pages#search', as: :search

    resources :users, except: [:new, :edit]
    resources :courses, except: [:new, :edit] do
      resources :cards, only: [:index]
    end
    resources :cards, except: [:new, :edit, :index]
    resources :enrollments, only: [:create, :destroy]
    resources :user_card_histories, only: [:create, :update, :destroy]
    resources :friendships, only: [:create, :destroy, :index, :update]
    resources :comments, except: [:new, :edit, :show]
  end
end
