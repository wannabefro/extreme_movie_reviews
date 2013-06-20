class FlagsController < ApplicationController

  def new
    @review = Review.find(params[:review_id])
    @movie = Movie.find(params[:movie_id])
    @flag = @review.flags.build
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @flag = @review.flags.new(params[:flag])
    @flag.user = current_user
    if @flag.save
      @review.flag
      redirect_to movie_reviews_path(@movie)
    else
      render 'new'
    end
  end

end
