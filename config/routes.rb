Rails.application.routes.draw do
  get 'events/new'

  get 'events/create'

  get 'creations/new'

  get 'sessions/new'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "events#index"
  resources :users
  resources :creations
  resources :events

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
