Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  # Get the register user form
  root 'users#new'
   # Post the register user form
  post '/', to: 'users#create', as: 'user_registration'
  # Login
  post '/login', to: 'sessions#create', as: 'login'
  # Logout
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # Invitation to party
  post '/events/:id/register', to: 'registrations#create'

  get '/events', to: 'events#index', as: 'events'

  get '/new/event', to: 'events#new', as: 'new_event'

  post '/new/event', to: 'events#create'

  get '/event/:id', to: 'events#show', as: 'event'

  post '/event/:id/registration', to: 'events#register', as: 'register'

  #get '/users', to: 'users#index'
  #get '/user/:id/edit', to: 'users#edit', as: 'edit_profile'
  #post '/user/:id/edit', to: 'users#update'
  #delete '/user/:id', to: 'users#destroy', as: 'delete_profile'
  
end
