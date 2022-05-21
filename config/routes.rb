Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #
  #   get '/users/sign_out', to: 'users/sessions#destroy'
  # end
  # Defines the root path route ("/")
  root "home#home"
end
