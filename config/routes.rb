Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  # 設定済み；resources :homes, only: [:index, :about]
  get '/home/about' => 'homes#about'
  

  resources :books
  # only: [:index, :new, :create, :show, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



# ----------feedback below----------

# ・routes.rbに不要なコードがあります。
# homesコントローラに関するルーティングはindexアクションとaboutアクションの2つだけで、
# 3行目と5行目で上手くできています。そのためresourcesメソッドを使う必要はありません。
# またbooksコントローラに関するルーティングは、resourcesメソッドで生成されるルーティングを
# ほぼ全て使用するのでonlyオプションで制約する必要はありません。

# PS: users#newも使用していないので不要