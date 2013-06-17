class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @recent_review = RecentReview.where("user_id = #{@user.id}")
    @reviews = @recent_review.last(3)

  end

end
