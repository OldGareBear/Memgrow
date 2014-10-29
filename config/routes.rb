Rails.application.routes.draw do
  root to: "static_pages#home"

  namespace "api" do
    resources :users
    resources :courses do
      resources :cards
    end
  end

  resources :users
  resources :courses do
    resources :cards
  end

  resources :enrollments, only: [:create, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
