Rails.application.routes.draw do
  root to: "static_pages#home"
  
  namespace "api" do
    resource :users
  end
  
  resource :users
  
  resource :session, only: [:new, :create, :destroy]
end
