Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :users, except: [:new, :edit] do 
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
    resources :likes, only:[:index]
    member do
      get :favorites
    end
    resources :collections, only: [:index]
    resources :collection_contents, only: [:create]
  end
  resources :artworks, only: [:show, :update, :create, :destroy] do
    resources :comments, only: [:index]
    resources :likes, only: [:index]
    member do
      patch :favorite
      patch :unfavorite
    end
  end
  resources :artwork_shares, only: [:create, :destroy] do
    member do
      patch :favorite
      patch :unfavorite
    end
  end
  resources :comments, only: [:create, :destroy] do 
    resources :likes, only: [:index]
  end

  resources :likes, only: [:create, :destroy]

  resources :collections, only: [:create, :destroy, :show, :update] do 
    resource :collection_contents, only: [:index]
  end
  resources :collection_contents, only: [:destroy]
  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # post '/users', to: 'users#create', as: 'create_user'
  # patch '/users/:id', to: 'users#update', as: 'update_user'
  # put '/users/:id', to: 'users#update', as: 'update_user2'
  # get '/users/:id', to: 'users#edit', as: 'edit_user'
  # delete '/users/:id', to: 'users#destroy', as: 'delete_user' 

end
