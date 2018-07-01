Rails.application.routes.draw do



  resources :categories, except: [:destroy]
  resources :users, except: [:new]
  resources :pages
  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'about', to: 'pages#about'
  resources :articles do
    resources :comments
    end
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
