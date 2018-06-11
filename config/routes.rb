Rails.application.routes.draw do

  root 'pages#/home'
  get 'pages/index'
  get 'about', to: 'pages#about'
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
