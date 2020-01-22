Rails.application.routes.draw do
  root to: 'questions#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :users do
    resources :questions
    resources :answers
  end

  resources :questions do
    resources :answers
  end

  resources :answers do
    resources :users
  end
end
