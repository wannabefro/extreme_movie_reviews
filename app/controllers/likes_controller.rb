class LikesController < ApplicationController

  def new
    @like = @likeable.likes.new
  end

  def create
    @like = Like.new(params[:like])
    @like.user = current_user
    if @like.save
      flash[:notice] = 'Like added'
      redirect_back_or_to_default
    else
      flash[:notice] = 'There can only be one!'
      redirect_back_or_to_default
    end
  end
end
