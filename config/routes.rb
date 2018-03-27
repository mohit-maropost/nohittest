Rails.application.routes.draw do
  get 'dashborads/index'
  get 'invites/check_url'
  root 'dashborads#index'
  resources :invites 
  devise_for :users, controllers: {registrations: 'users/registrations'}
end
