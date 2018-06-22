Rails.application.routes.draw do

  resources :users, except: [:new]
  root 'articles#index'
  get 'pages/index'
  get 'signup', to: 'users#new'
  get 'about', to: 'pages#about'
  resources :articles do
    resources :comments


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
