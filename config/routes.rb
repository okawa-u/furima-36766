Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
  # root to 'コントローラ名#アクション名'
  # ルートへアクセスしたときitemsコントローラのindexアクションを実行

  resources :items do
    resources :orders, only: [:index, :create]
  end  
end 
# resources :コントローラー名 Ex.http://localhost:3000/items/newにアクセスした場合、itemsコントローラーのnewアクションが実行される
# ネストにより，どの商品に対する注文なのかURIから判断可能にしている