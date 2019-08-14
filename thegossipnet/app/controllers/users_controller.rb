class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	@mp = params[:mpass]
  	@cmp = params[:confirm_mpass]
  	@city = City.all 
# test confirmation password et création de l'utilisateur
  	if @mp == @cmp 
  			@user = User.new(
  			first_name: params[:first_name],
  			last_name: params[:last_name],
  			age: params[:age],
  			email: params[:email],
  			description: params[:description],
  			password: @mp)
# test pour voir si la ville donné exist ou pas
		@city.each do |city|
  			if city.name == params[:city]
  				@ville = 1
  				@check = city
  			end
  		end
  		if @ville == 1
  			@user.city = @check
  		else
  			@new = City.create(name: params[:city],
  			zip_code: "#{rand(5000)}")
  			@user.city = @new
  		end
# test sauvegarde
  		if @user.save 
        log_in(@user)
  			redirect_to gossips_path, :notice => "welcome,iscription success"
  		else
  			render "new",:notice => "donné incomplete"
  		end
  	else
  		render "new"
  	end
  	
  end
  def show
  	@user = User.find(params[:id])
  end
  def edit
  	@user = User.find(params[:id])
  	@test = 0
  end
  def update
  	@city = City.all
  	@user = User.find(params[:id])
  	@user_first_name = params[:first]
  	@user_last_name = params[:last]
  	@user_age = params[:ages]
  	@user_description = params[:descriptions]
  	@user_email = params[:e_mail]
# confirmation ville
  	@city.each do |city|
  		if city == params[:cite]
  			ok = 1
  			@ville = city
  		end
  	end
  	if ok == 1
  		@user_city = @ville
  	else
  		@new = City.create(name: params[:cite],
  		zip_code: "#{rand(5000)}")
  		@user_city = @new
  	end
# confirmation password
  
	@user.update(first_name: @user_first_name,
		last_name: @user_last_name,
			age: @user_age,
			description: @user_description,
			email: params[:e_mail],
			city: @user_city,
			password: params[:mpas])
# retour au page de profil
	redirect_to user_path(params[:id]),:notice =>"success update"
	
  	 
  end
  def destroy
  end
end
