Rails.application.routes.draw do
  	
	root 'dashboard#index'

	devise_for :users

	resources :products, only: [:index]

	get "angular_test", to: "angular_test#index"
end
