class PageController < ApplicationController
  def first
  end
  def team
  end 
  def contact
  end
  def accueil
  	@user = User.all
  	@gos = Gossip.all
  end
  def page
  	@gossip = Gossip.find(params[:i])
  end
  def detail          
  	@user = User.find(params[:i])
  end
end
