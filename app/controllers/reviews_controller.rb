class ReviewsController < ApplicationController
  before_filter :authenticate_user!


  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(params[:review])
    @review_all = Review.all
    @review.user = current_user

   
    if @review.save(params[:review])
      redirect_to movie_path(@movie)
    else
      flash[:notice] = 'Cannot save review. You cannot review the same movie twice, and fields cannot be empty.'
      redirect_to movie_path(@movie)
    end
  end

  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  def show
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])

    RecentReview.create(:user_id => @user.id, :review_id => @review.id)
  end
end