Rails.application.routes.draw do
  get 'likes/new'
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
