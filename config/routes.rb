Rails.application.routes.draw do

  #TODO: figure out '/profile' (kashif used 'mix')

  get '/pages/:page' => 'pages#show'

  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Users
  get '/users' => 'users#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # Texts
  get '/texts' => 'texts#index' #?
  get '/texts/new' => 'texts#new' #User
  post '/texts' => 'texts#create' #User
  get '/texts/:id' => 'texts#show' #User

  #TODO: choose how user should be able to go through form to create
  # text, but then also be able to edit that text.
  # 1) save to database after first form, then make next page an edit page, and button, when clicked would both save to DB and send via twilio
  # 2) use cookies to wait to save text to database until user has had oppny to edit.

  # get '/texts/:id/edit' => 'texts#edit'
  # patch '/texts/:id' => 'texts#update'
  # delete '/texts/:id' => 'texts#destroy'

  # Contacts
  get '/contacts' => 'contacts#index' #User
  get '/contacts/new' => 'contacts#new' #User
  post '/contacts' => 'contacts#create' #User
  get '/contacts/:id' => 'contacts#show' #?
  get '/contacts/:id/edit' => 'contacts#edit' #User
  patch '/contacts/:id' => 'contacts#update' #User
  delete '/contacts/:id' => 'contacts#destroy' #User
  # TODO: add line of code to views for each page that only signed-in user may see

  # Emotions
  get '/emotions' => 'emotions#index' #?
  get '/emotions/new' => 'emotions#new' #Admin
  post '/emotions' => 'emotions#create' #Admin
  get '/emotions/:id' => 'emotions#show' #User
  get '/emotions/:id/edit' => 'emotions#edit' #Admin
  patch '/emotions/:id' => 'emotions#update' #Admin
  delete '/emotions/:id' => 'emotions#destroy' #Admin
  # TODO: create admin auth
  # TODO: add marked routes to admin only, so users may not see

end
