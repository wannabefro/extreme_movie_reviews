class ReviewsController < ApplicationController
  before_filter :authenticate_user!


  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(params[:review])
    @review.user = current_user

    if @review.save
      redirect_to movie_path(@movie)
    else
      flash[:notice] = 'Cannot save review. You cannot review the same movie twice, and fields cannot be empty.'
      redirect_to movie_path(@movie)
    end
  end

  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
    @like = @movie.likes.new
  end

  def show
    @user = current_user
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @recent_reviews = RecentReview.where("user_id = ?", @user.id).last(3).reverse

    if @recent_reviews.blank?
      RecentReview.create(:user => @user, :review => @review)
    else
      if @recent_reviews.last.review_id == @review.id
        0
      else
        RecentReview.create(:user => @user, :review => @review)
      end
    end
    
  end
end
