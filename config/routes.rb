Rails.application.routes.draw do
  resources :projects, only: [ :create, :index, :show, :update, :edit, :destroy ] do
    resources :user_projects, only: [ :create ]
  end
  devise_for :users

  get "profile", to: "pages#profile"
  get "edit", to: "pages#edit"
  get "index", to: "pages#index"
  root to: 'pages#home'
  get "json_to_send", to: "users#json_to_send"
  post "create_ext", to: "items#create_ext"
  resources :favorites, only: :index
  resources :items, only: [:index, :show, :destroy] do
    resources :tags, only: [:create, :destroy]
    resources :project_items, only: [:create, :destroy]
    get "quickshow", to: "items#quickshow", as: :quickshow
  end

  resources :user_projects, only: [ :destroy ]

  resources :tags, only: [:index, :show, :create]
  patch "items/:id/like", to: "items#like", as: :like
  patch "items/:id/dislike", to: "items#dislike", as: :dislike

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
