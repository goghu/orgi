Rails.application.routes.draw do
  resources :categoria
  # get '/users/sign_in', to: 'users/sessions#new', as: 'new_user_session'
  # post '/users/sign_in', to: 'users/sessions#create', as: 'user_session'
  devise_for :users, path: 'usuarios', controllers: { sessions: 'users/sessions' }
  # devise_for :users, path: 'usuarios', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
 
  # resources :cotizaciones
  resources :users
  get 'welcome/index'

  root :to => "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
