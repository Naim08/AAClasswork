Rails.application.routes.draw do
  # get 'session/create'
  # get 'session/new'
  # get 'session/destory'
  # get 'goals/create'
  # get 'goals/destory'
  # get 'users/index'
  # get 'users/create'
  # get 'users/show'
  # get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:create, :new, :show, :index] do
    resources :goals, only: [:create, :new]
  end
  resources :goals, only: [:destory]

  resource :session, only: [:create, :new, :destroy]
end
