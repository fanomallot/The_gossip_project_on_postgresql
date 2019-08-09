class CommentController < ApplicationController
  def new
    @comment = Comment.new
	end
  def create
  	@user = User.all
    @gossip = Gossip.find(params[:gossip_id])
  	@comment = Comment.new(content: params[:content] , gossip: @gossip,user: @user[rand(0..16)])
  	if @comment.save
  		redirect_to "/gossips/#{@comment.gossip.id}"
  	else
  		render "new"
  	end
  end
  def edit	
  	@comment = Comment.find(params[:id])
  end
  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update(content: params[:content])
  		redirect_to "/gossips/#{@comment.gossip.id}"
  	else
  		render "edit"
  	end
  end
  def destroy
  	@comment =Comment.find(params[:id])
  	@comment.destroy
  	redirect_to "/gossips/#{@comment.gossip.id}"
  end
end
