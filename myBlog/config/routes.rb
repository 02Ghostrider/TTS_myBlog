Rails.application.routes.draw do
  root 'posts#index'
  get '/' => 'posts#index'
  # root 'sessions#index'  

  post '/register' => 'sessions#register'
  post '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'

  get '/sessions/index' => 'sessions#index'

  get 'users/:id/update' => 'users#update'
  get 'users/:id/show' => 'users#show'
  get 'users/:id/edit' => 'users#edit'

  delete '/delete/:id' => 'users#delete'

  resources :comments
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end
