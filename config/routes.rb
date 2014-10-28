Rails.application.routes.draw do
  root to: "static_pages#home"
  
  namespace "api" do
    resources :users
  end
  
  resources :users
  
  resource :session, only: [:new, :create, :destroy]
end
