Rails.application.routes.draw do

  # devise_for :users
  
  root 'homes#index'

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :profiles
  resources :homes
  resources :skills
  resources :pictures
  resources :articles

 



  namespace :api do
    namespace :v1 do
      resources :articles, :defaults => { :format => 'json' }
      resources :session
    end
  end

end
