class MoviesController < ApplicationController
	helper_method :likeable
	
	def new
		@movie = Movie.new

	end

	def create 

		@movie = Movie.new(params[:movie])
		if user_signed_in?
			if @movie.save
				redirect_to @movie
			else
				flash[:message] = "Invalid Criteria"
				render action: "new"
			end
		else
			flash[:notice] = "You must sign in"
			redirect_to new_user_session_path
		end
	end

	def show 
		@movie = Movie.find(params[:id])
		# @reviews = @movie.reviews
		@like = @movie.likes.new

	end

	def index
		@movies = Movie.all
	end

	protected

	def likeable
		@likeable ||= @movie
	end
end
