Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  # Get the register user form
  root 'users#new'
  # Login
  post '/login', to: 'sessions#create', as: 'login'
  # Logout
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # Post the register user form
  post '/', to: 'users#create', as: 'post_registration'


  get '/user/:id/edit', to: 'users#edit', as: 'edit_profile'
  post '/user/:id/edit', to: 'users#update'
  delete '/user/:id', to: 'users#destroy', as: 'delete_profile'
  
  resources :events
end
