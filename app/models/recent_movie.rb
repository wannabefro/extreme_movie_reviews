class RecentMovie < ActiveRecord::Base
  attr_accessible :movie_id, :user_id

  # belongs_to :user, :movie
end
