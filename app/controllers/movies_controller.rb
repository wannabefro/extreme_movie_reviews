class MoviesController < ApplicationController

	def new
		@movie = Movie.new

	end

	def create 
		@movie = Movie.new(params[:movie])
		if @movie.save
			redirect_to @movie
		else
			flash[:message] = "Invalid Criteria"
			render action: "new"
		end
	end

	def show 
		@movie = Movie.find(params[:id])

	end

end
