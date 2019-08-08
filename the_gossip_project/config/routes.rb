Rails.application.routes.draw do
	get '/',to:  'page#first'
	get '/team',to: 'page#team'
	get '/contact',to: 'page#contact'
	get '/accueil',to: 'page#accueil'
	get '/:i',to: 'page#page'
	get '/:i/detail',to: 'page#detail'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
