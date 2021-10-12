Rails.application.routes.draw do
  get 'items/index'
  get 'items/new'
  devise_for :users
  get 'furima/index'
  
  root to: "furima#index"
  get 'items-３３new', to: 'items#new'
  resources :items
end