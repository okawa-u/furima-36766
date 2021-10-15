Rails.application.routes.draw do
  devise_for :users
  
  root to: "furima#index"

  get 'items-new', to: 'items#new'
  resources :items, only: [:index, :new, :create]
end