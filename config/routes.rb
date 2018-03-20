Rails.application.routes.draw do
  resources :projects, only: [ :create, :index, :show, :update, :edit, :destroy ]
  devise_for :users
  get "profile", to: "pages#profile"
  get "index", to: "pages#index"
  root to: 'pages#home'
  resources :items, only: [:index, :show, :destroy]
  resources :tags, only: [:index, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
