Rails.application.routes.draw do

  resources :users, except: [:new]
  resources :pages
  root 'pages#index'
   get 'signup', to: 'users#new'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end


  get 'about', to: 'pages#about'
  resources :articles do
    resources :comments


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
