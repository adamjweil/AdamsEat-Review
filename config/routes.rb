Rails.application.routes.draw do
  resources :reviews
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #users
  get '/users/new' =>'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  # get '/logout'

  #login sessions
  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#delete'
  get '/logout' => 'sessions#delete'

  post '/restaurants/:id/reviews' => 'restaurants#review'
  get '/restaurants/:id/delete' => 'restaurants#destroy'
  put 'restaurants/:id' => 'restaurants#update'
  root to: 'restaurants#index'
end
