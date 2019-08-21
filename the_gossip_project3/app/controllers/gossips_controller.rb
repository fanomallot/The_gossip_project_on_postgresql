class GossipsController < ApplicationController
  def first
  end
  def index
  	@user = User.all 
  end
  def show
  	@gossip = Gossip.find(params[:id ])
  end
  def new
    @gossip = Gossip.new
  end
  def create
  	@gossip = Gossip.new(title: params[:title] , content: params[:content] , user: User.last) # avec xxx qui sont les données obtenues à partir du formulaire
  if @gossip.save# essaie de sauvegarder en base @gossip
  	redirect_to gossips_path, :notice => "Le potin a été créé"
    # si ça marche, il redirige vers la page d'index du site
  else
  	render "new", :notice => "manque de donné,recréé le potin"
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  end

  end
  def edit
    @gossip = Gossip.find(params[:id])
  end
def update
  @gossip = Gossip.find(params[:id])
  if @gossip.update(content: params[:content])
    redirect_to gossip_path
  else
    render "edit"
  end
end
  def destroy
    @gossip= Gossip.find(params[:id])
    r = Relation.where(gossip_id: @gossip.id)
    r.destroy_all
    c = Comment.where(gossip_id: @gossip.id)
    c.destroy_all
    @gossip.destroy
    redirect_to gossips_path
  end
end
