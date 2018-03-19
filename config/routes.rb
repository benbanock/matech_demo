Rails.application.routes.draw do
  resources :projects, only: [ :create, :index, :show ]
  devise_for :users
  root to: 'pages#home'
  resources :items, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
