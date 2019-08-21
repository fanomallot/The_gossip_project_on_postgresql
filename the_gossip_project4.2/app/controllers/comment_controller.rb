class CommentController < ApplicationController
  def create
  	
    @gossip = Gossip.find(params[:gossip_id])
  	@comment = Comment.new(content: params[:content] , gossip: @gossip,user: current_user)
  	if @comment.save
  		redirect_to "/gossips/#{@comment.gossip.id}"
  	else
      flash[:danger] = "manque de donné,recommenté"
  		redirect_to "/gossips/#{@comment.gossip.id}" 
  	end
  end
  def edit	
  	@comment = Comment.find(params[:id])
  end
  def update
  	@comment = Comment.find(params[:id])
  	if @comment.update(content: params[:content])
      flash[:success] = "comment edit success"
  		redirect_to "/gossips/#{@comment.gossip.id}"
  	else
      flash[:danger] = "edit error"
  		render "edit"
  	end
  end
  def destroy
  	@comment =Comment.find(params[:id])
  	@comment.destroy
    flash[:success] = "Comment delete success"
  	redirect_to "/gossips/#{@comment.gossip.id}"
  end
end

