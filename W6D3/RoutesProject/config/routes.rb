Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :create, :destroy], shallow: true do
    resources :artworks, only: :index do
      resources :favorite, only: [:create, :index], on: :collection
    end
    resources :comments, only: :index do
        get 'favorites', on: :collection
      end
  end


  resources :artworks, only: [:show, :create, :update, :destroy], shallow: true do
    resources :comments, only: :index
  end

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]
  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  # get 'artworks', to: 'artworks#index'
  # post 'artworks', to: 'artworks#create'
  # get 'artworks/new', to: 'artworks#new', as: 'new_artwork'
  # get 'artworks/:id/edit', to: 'artworks#edit', as: 'edit_artwork'
  # get 'artworks/:id', to: 'artworks#show', as: 'artwork'
  # patch 'artworks/:id', to: 'artworks#update'
  # put 'artworks/:id', to: 'artworks#update'
  # delete 'artworks/:id', to: 'artworks#destroy'

  # get 'artwork_shares', to: 'artwork_shares#index'
  # post 'artwork_shares', to: 'artwork_shares#create'
  # get 'artwork_shares/new', to: 'artwork_shares#new', as: 'new_artwork_share'
  # get 'artwork_shares/:id/edit', to: 'artwork_shares#edit', as: 'edit_artwork_share'
  # get 'artwork_shares/:id', to: 'artwork_shares#show', as: 'artwork_share'
  # patch 'artwork_shares/:id', to: 'artwork_shares#update'
  # put 'artwork_shares/:id', to: 'artwork_shares#update

end
