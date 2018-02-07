Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  # '/' route in pages_controller def home
  root 'pages#home'
  # Login
  post '/login', to: 'sessions#create', as: 'login'
  # Logout
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  # Get the register user form
  get '/register', to: 'users#new', as: 'register'
  # Post the register user form
  post '/register', to: 'users#create', as: 'post_registration'

  resources :events
end
