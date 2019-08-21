class SessionsController < ApplicationController
	def create
# chercher l'éxistance de l'utilisateur
		user = User.find_by(email: params[:email])
# verification s'il exist et que le mots de passe est égal
		if user && user.authenticate(params[:getpass])
		log_in(user)
# redirige où tu veux, avec un flash ou pas
 		flash.now[:success] = 'Login succes'
 		
 		redirect_to gossips_path
 		else
 			flash.now[:danger] = 'Invalid email/password combination'
 			
 			redirect_to '/'
 		end
	end
	def destroy
	
	session.delete(:user_id)
		flash.now[:success] = 'Compte déconnecté'
		redirect_to '/'
	end
end

