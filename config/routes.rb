Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root 'homes#index'
  get '/home/about' => 'homes#about'
  
  resources :books
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html