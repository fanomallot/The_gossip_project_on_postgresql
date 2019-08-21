class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:first, :login]
  def first

  end
  def login
  end
  def index
  	@user = User.all 
  end
  def show
  	@gossip = Gossip.find(params[:id ])
    @comment = Comment.new
  end
  def new
    @gossip = Gossip.new
  end
  def create
  @gossip = Gossip.new(title: params[:title] , content: params[:content]) # avec xxx qui sont les données obtenues à partir du formulaire
  @gossip.user = current_user
  if @gossip.save# essaie de sauvegarder en base @gossip
    flash[:success] = "Le potin a été créé"
    redirect_to gossip_path(@gossip.id)
    # si ça marche, il redirige vers la page d'index du site
  else
    flash[:danger] = "manque de donné,recréé le potin"
  	render "new"
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  end

  end
  def edit
    @gossip = Gossip.find(params[:id])
  end
def update
  @gossip = Gossip.find(params[:id])
  if @gossip.update(content: params[:content])
    flash[:success] = "Le potin a été modifié"
    redirect_to gossip_path
  else
    flash[:danger] = "Erreur modification"
    render "edit"
  end
end
  def destroy
    @gossip= Gossip.find(params[:id])
    r = Relation.where(gossip_id: @gossip.id)
    r.destroy_all
    c = Comment.where(gossip_id: @gossip.id)
    c.destroy_all
    l = Like.where(gossip_id: @gossip.id)
    l.destroy_all
    @gossip.destroy
    flash[:success] = "Le potin a été supprimé"
    redirect_to gossips_path
  end
  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in before"
      redirect_to "/login"
    end
  end
end
