Rails.application.routes.draw do
	get '/',to:  'gossips#first'
	resources :gossips do
	resources :comment
	end
	resources :users
	resources :city, only: [ :index , :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
