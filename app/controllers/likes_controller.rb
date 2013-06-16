class LikesController < ApplicationController

  def new
    @like = @likeable.likes.new
  end

  def create
    @like = @likeable.likes.new(params[:like])
    @like.liked = true

    if @like.save
      render "movies/show", notice: "Like added!"
    else
      render "new"
    end
  end
end
