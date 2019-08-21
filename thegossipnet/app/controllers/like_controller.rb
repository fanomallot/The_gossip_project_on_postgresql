class LikeController < ApplicationController
def create
	@gossip = Gossip.find(params[:gossip_id])
	@like = Like.create(user: current_user , gossips: [@gossip])
	redirect_back fallback_location: '/' ,allow_other_host: false
end
def index
	@gossip = Gossip.find(params[:gossip_id])
end
def destroy
	@gossip = Gossip.find(params[:gossip_id])
	# current_user.likes.reltationlg.destroy
	@gossip.likes.each do |like|
		if like.user == current_user
			like.relationlgs.destroy_all
			like.destroy
		end
	end
	redirect_back fallback_location: '/' ,allow_other_host: false
end
end
