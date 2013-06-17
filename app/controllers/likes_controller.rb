class LikesController < ApplicationController

  def new
    @like = @likeable.likes.new
  end

  def create
    @like = Like.new(params[:like])
    @like.user = current_user
    puts "something where to look #{@like.likeable_type}"
    if @like.save
      redirect_to :back, notice: 'Like added'
    else
      redirect_to :back, notice: "We have your credit card details..."
    end
  end
end
