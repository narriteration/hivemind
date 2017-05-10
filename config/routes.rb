Rails.application.routes.draw do

  resources :texts
  resources :contacts

  # get '/texts' => 'texts#index', as: 'texts'
  # post '/texts' => 'texts#create'
  # get '/texts/new' => 'texts#new', as: 'new_text'
  # get '/texts/:id/edit' => 'texts#edit', as: 'edit_text'
  # patch '/texts/:id' => 'texts#update'
  # put '/texts/:id' => 'texts#update'
  # delete '/texts/:id' => 'texts#destroy'

  root :to => "pages#home"

  # Twilio
  get 'texts/:id/trigger' => 'texts#trigger_sms_alerts', as: 'trigger'

  # Pages
  get '/pages/home' => 'pages#home'
  get '/pages/about' => 'pages#about'
  get '/pages/profile' => 'pages#profile'

  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Users
  get '/users' => 'users#index', as: 'users'
  get '/signup' => 'users#new', as: 'signup'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit', as: 'users_edit'
  patch '/users/:id' => 'users#update'
  delete '/users' => 'users#destroy'

  # Contacts
  get '/contacts' => 'contacts#index'
  get '/contacts/new' => 'contacts#new'
  post '/contacts' => 'contacts#create'
  get '/contacts/:id' => 'contacts#show'
  get '/contacts/:id/edit' => 'contacts#edit'
  patch '/contacts/:id' => 'contacts#update'
  delete '/contacts/:id' => 'contacts#destroy'

  # Emotions
  get '/emotions' => 'emotions#index', as: 'emotions'
  get '/emotions/new' => 'emotions#new', as: 'emotions_new'
  post '/emotions' => 'emotions#create'
  get '/emotions/:id' => 'emotions#show', as: 'emotion'
  get '/emotions/:id/edit' => 'emotions#edit', as: 'emotion_edit'
  patch '/emotions/:id' => 'emotions#update'
  delete '/emotions/:id' => 'emotions#destroy'
  # TODO: create admin auth
  # TODO: add marked routes to admin only, so users may not see

  #error handling for pages that do not exist
  get "*path" => 'pages#not_found'

end
