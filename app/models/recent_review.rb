class RecentReview < ActiveRecord::Base
  attr_accessible :user, :review

  belongs_to :user
  belongs_to :review
  
end
