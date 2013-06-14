class ReviewsController < ApplicationController
  before_filter :authenticate_user!


  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(params[:review])
    @review.user = current_user

   
    if @review.save(params[:review])

      redirect_to movie_path(@movie)
    else
      # flash[:notice] = @review.errors.
      # render "movies/show"
      redirect_to movie_path(@movie)
    end
  end
end