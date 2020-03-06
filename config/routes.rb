Rails.application.routes.draw do
  devise_for :users
  resources :articles
  root 'articles#index'
  get '/example', to: 'articles#example'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
