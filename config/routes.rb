Rails.application.routes.draw do
  root to: "static_pages#home"

  namespace "api" do
    resources :users
    resources :courses
  end

  resources :users
  resources :courses

  resources :enrollments, only: [:create, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
