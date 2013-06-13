class ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(params[:review])

    if @review.save
      redirect_to movie_path(@movie)
    else
      render "movies/show"
    end

  end

end