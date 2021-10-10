Rails.application.routes.draw do
  devise_for :users
  get 'furima/index'
  root to: "furima#index"
end