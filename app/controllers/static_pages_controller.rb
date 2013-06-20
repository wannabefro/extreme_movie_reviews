class StaticPagesController < ApplicationController
  def index
    @movies = Movie.all
  end
end
