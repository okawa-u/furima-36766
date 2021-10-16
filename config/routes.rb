Rails.application.routes.draw do
  devise_for :users
  
  root to: "furima#index"

  resources :items, only: [:index, :new, :create]
end