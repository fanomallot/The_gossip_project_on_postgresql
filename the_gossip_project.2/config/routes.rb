Rails.application.routes.draw do
	get '/',to:  'gossips#first'
	resources :gossips 
	resources :users
	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
