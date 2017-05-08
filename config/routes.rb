Rails.application.routes.draw do

  resources :texts
  resources :contacts

  root :to => "pages#home"

  # Pages
  get '/pages/home' => 'pages#home'
  get '/pages/about' => 'pages#about'
  get '/pages/profile' => 'pages#profile'

  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Users
  get '/users' => 'users#index', as: 'users' #ADMIN
  get '/signup' => 'users#new', as: 'signup'
  post '/users' => 'users#create'
  # get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'users_edit'
  patch '/users/:id' => 'users#update'
  delete '/users' => 'users#destroy'

  # Texts
  # get '/texts' => 'texts#index', as: 'texts'
  # get '/texts/new' => 'texts#new', as: 'texts_new'
  # post '/texts' => 'texts#create'
  # get '/texts/:id' => 'texts#show', as: 'text'

  #TODO: choose how user should be able to go through form to create
  # text, but then also be able to edit that text.
  # 1) save to database after first form, then make next page an edit page, and button, when clicked would both save to DB and send via twilio
  # 2) use cookies to wait to save text to database until user has had oppny to edit.

  # get '/texts/:id/edit' => 'texts#edit'
  # patch '/texts/:id' => 'texts#update'
  # delete '/texts/:id' => 'texts#destroy'

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
  delete '/emotions/:id' => 'emotions#destroy' #Admin
  # TODO: create admin auth
  # TODO: add marked routes to admin only, so users may not see

  #error handling for pages that do not exist
  get "*path" => 'pages#not_found'

end
