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
		@user = current_user
		@movie = Movie.find(params[:id])
		@like = @movie.likes.new
		@recent_movies = RecentMovies.where("user_id = ?", @user.id).limit(3)

    if @recent_movies.blank?
      RecentMovies.create(:user => @user, :movie => @movie)
    else
      if @recent_movies.last.movie_id == @movie.id
        0
      else
        RecentMovies.create(:user => @user, :movie => @movie)
      end
    end

	end

	def index
		@movies = Movie.all
	end

end
