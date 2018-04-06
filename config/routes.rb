Rails.application.routes.draw do
  get 'teams/show'

  get 'dashborads/index'
  get 'invites/token_url'
  root 'dashborads#index'
	resources :accounts do 
		resources :teams
	end
  resources :invites 
  devise_for :users, controllers: {sessions: 'users/sessions' , registrations: 'users/registrations'}
end
