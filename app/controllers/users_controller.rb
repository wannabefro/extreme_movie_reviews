class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = RecentReview.where("user_id = ?", @user.id).last(3).reverse
    @movies = RecentMovies.where("user_id = ?", @user.id).last(3).reverse
  end

end
