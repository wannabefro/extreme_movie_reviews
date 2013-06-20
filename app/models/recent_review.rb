class RecentReview < ActiveRecord::Base
  attr_accessible :user, :review

  validates_presence_of :review, :user

  belongs_to :user
  belongs_to :review
  
end
