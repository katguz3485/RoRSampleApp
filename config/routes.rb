Rails.application.routes.draw do

  resources :users
  root 'articles#index'
  get 'pages/index'
  get 'about', to: 'pages#about'
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
