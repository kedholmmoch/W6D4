Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :users, except: [:new, :edit] do 
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:show, :update, :create, :destroy]
  resources :artwork_shares, only: [:create, :destroy]

  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # post '/users', to: 'users#create', as: 'create_user'
  # patch '/users/:id', to: 'users#update', as: 'update_user'
  # put '/users/:id', to: 'users#update', as: 'update_user2'
  # get '/users/:id', to: 'users#edit', as: 'edit_user'
  # delete '/users/:id', to: 'users#destroy', as: 'delete_user' 

end
