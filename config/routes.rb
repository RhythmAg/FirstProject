Rails.application.routes.draw do
  devise_for :users
  resources :articles do
  	resources :comments, except: :index
  end

  resources :users do
   resources :comments, only: [:index]
  end
  root 'articles#index'
  get '/example', to: 'articles#example'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
