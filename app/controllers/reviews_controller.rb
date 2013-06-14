class ReviewsController < ApplicationController
  before_filter :authenticate_user!


  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(params[:review])

    if @movie.unique_review?(current_user)
      if @review.save(params[:review])
        current_user.reviews << @review
        redirect_to movie_path(@movie)
      else
        flash[:notice] = "Cannot be blank"
        redirect_to movie_path(@movie)
      end
    else
      flash[:notice] = "You have already reviewed this movie"
      redirect_to movie_path(@movie)
    end
  end
end