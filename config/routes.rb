Rails.application.routes.draw do
  root 'hi#/home'
  get 'about', to: 'hi#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
