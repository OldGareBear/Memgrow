Rails.application.routes.draw do
  root to: "static_pages#home"

  namespace "api" do
    resources :users
    resources :courses
  end

  resources :users
  resources :courses

  resource :session, only: [:new, :create, :destroy]
end
