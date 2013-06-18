class RecentMovies < ActiveRecord::Base
  attr_accessible :movie, :user

  belongs_to :user
  belongs_to :movie
end
