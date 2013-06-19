class RecentMovies < ActiveRecord::Base
  attr_accessible :movie, :user

  validates_presence_of :movie, :user

  belongs_to :user
  belongs_to :movie
end
