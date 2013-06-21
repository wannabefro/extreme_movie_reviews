class ExtminController < ApplicationController
	before_filter :require_admin

	def index
		@users = User.all
		@flags = Flag.all
	end

	def show 
		@user = User.find(params[:id])
	end

	def approval
		@review = Review.find(params[:id])
		@flag = Flag.where("review_id = ?", @review.id).last

		@review.approve
		@review.save
		@flag.destroy

		redirect_to extmin_index_path
	end

	private
	def require_admin
		unless user_signed_in? && current_user.admin?
			flash[:notice] = "You aint no admin"
			redirect_to root_path
		end

	end


end
