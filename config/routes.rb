Rails.application.routes.draw do
  get 'dashborads/index'
  root 'dashborads#index' 
  devise_for :users, controllers: {registrations: 'users/registrations'}
end
