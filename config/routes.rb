Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  root 'products#index'
  resources :products, only: [:index, :show] do
    collection do
      get :search
    end
  end
  resources :categories, only: [:index, :show]
  get 'about', to: 'pages#about'

  resources :users, only: [:index, :show]
end