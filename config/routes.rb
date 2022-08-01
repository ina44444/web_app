Rails.application.routes.draw do


  get 'sessions/new'
  get 'work/index'
  get 'work/choose_theme'
  get 'work/display_theme'
  get 'images/index'

  # work

  match 'work',                  to: 'work#index',                  via: 'get'
  match 'choose_theme',     to: 'work#choose_theme',      via: 'get'
  match 'display_theme',    to: 'work#display_theme',      via: 'post'


  resources :themes
  resources :images do
    resources :values
   end
  resources :users

  namespace :api, defaults: { format: :json } do
    match 'next_image', to: 'api#next_image', via: :get
    match 'prev_image', to: 'api#prev_image', via: :get
    match 'save_value',       to: 'api#save_value',   via: :get
  end


  root 'work#index'
  get 'help'    => 'main#help'
  get 'about'   => 'main#about'
  get 'contact' => 'main#contacts'
  get 'index' => 'main#index'
  get 'signup' => 'users#new'
  get 'home'=>'main#home'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
