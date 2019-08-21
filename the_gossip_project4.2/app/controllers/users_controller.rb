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
        flash[:success] = "welcome,iscription success"
  			redirect_to gossips_path
  		else
        flash[:danger] = "donné incomplete"
  			render "new"
  		end
  	else
      flash[:danger] = "donné incomplete"
  		render "new"
  	end
  	
  end
  def show

  	@user = User.find(params[:id])
  end
  def edit
  	@user = User.find(params[:id])

  end
  def update
  	@city = City.all
  	@user = User.find(params[:id])
# confirmation ville
  	@city.each do |city|
  		if city.name == params[:city]
  			@ok = 1
  			@ville = city
  		end
  	end
  	if @ok == 1
  		@user_city = @ville
  	else
  		@new = City.create(name: params[:cite],
  		zip_code: "#{rand(5000)}")
  		@user_city = @new
  	end
# confirmation password
  if @user.authenticate(params[:mpas])
    if @user.update(first_name: params[:first],
		  last_name: params[:last],
			age: params[:ages],
			description: params[:descriptions],
			email: params[:e_mail],
			city: @user_city,
			password: params[:mpas])
# retour au page de profil
      flash[:success] = "success update"
      redirect_to user_path(params[:id])
    else
      flash.now[:danger] = " Mots de passe incorrect"
      render "edit"
    end
	else
    flash.now[:danger] = " Mots de passe incorrect"
    render "edit"
  end
  	 
  end
  def destroy
    if params[:mpass] == params[:confirm_mpass] && current_user.authenticate(params[:mpass])
      r = Relation.where(gossip_id: current_user.gossips.ids)
      r.destroy_all
      l = Like.where(user_id: current_user.id)
      c = Comment.where(gossip_id: current_user.gossips.ids)
      l.each do |del|
        rlg = Relationlg.where(like_id: del.id)
        rlg.destroy_all
      end
      c.destroy_all
      l.destroy_all
      current_user.gossips.destroy_all
      current_user.destroy
      redirect_to gossips_path
    else
      render "show"
    end
  end
  def index 
  end
end
