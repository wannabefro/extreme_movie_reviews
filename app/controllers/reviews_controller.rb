class ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(params[:review])

    if user_signed_in?

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
    else
      flash[:notice] = "You must sign in"
      redirect_to new_user_session_path
    end
  end
end