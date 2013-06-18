class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = RecentReview.where("user_id = ?", @user.id).limit(3)
    @movies = RecentMovies.where("user_id = ?", @user.id).limit(3)
  end

end
