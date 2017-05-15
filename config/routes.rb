Rails.application.routes.draw do

  resources :concerts
  resources :users
  resources :attendances
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  get '/signup' => 'users#new'
  # get '/users/:id' =>"users#show"
  # get '/users/edit'=> "users#oedmd"
  post '/users' => 'users#create'
  root 'concerts#index'

end
