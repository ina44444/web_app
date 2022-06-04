Rails.application.routes.draw do
  get 'sessions/new'
  get 'work/index'
  get 'work/choose_theme'
  get 'work/display_theme'
  get 'images/index'

  # work

  match 'work',                  to: 'work#index',        via: 'get'
  match 'choose_theme',     to: 'work#choose_theme',      via: :get
  match 'display_theme',    to: 'images#index',     via: :get

  resources :themes
  resources :images
  resources :values
  resources :users




  root             'main#home'
  get 'help'    => 'main#help'
  get 'about'   => 'main#about'
  get 'contact' => 'main#contacts'
  get 'index' => 'main#index'
  get 'signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
