Rails.application.routes.draw do
  devise_for :users
  resources :articles do
  	resources :comments, except: :index
  end

  resources :users do
   resources :comments, only: [:index]
  end

  resources :news do
    resources :comments, except: :index
  end

  resources :profiles, only: [:show]
  resource :friendships, only: [:create,:destroy]
  root 'articles#index'
  resources :users, only: [:index] 
  get '/example', to: 'articles#example'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
