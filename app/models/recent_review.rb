class RecentReview < ActiveRecord::Base
  attr_accessible :user_id, :review_id

  has_many :users
  has_many :reviews
  
end
