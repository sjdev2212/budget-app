Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do

    get '/users/sign_out', to: 'users/sessions#destroy'
  end


  resources :categories do
  resources :expenses
end
  root "categories#index"
end
