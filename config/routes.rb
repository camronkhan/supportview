Rails.application.routes.draw do
  	
	root 'search#index'

	get 'search', to: 'search#index', as: 'search'

	devise_for :users

	namespace :api do
		namespace :v1 do
			resources :products, only: [:index, :show]
		end
	end
end
