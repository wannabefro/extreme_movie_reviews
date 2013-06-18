class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  has_many :recent_reviews

  attr_accessible :title, :body, :user, :movie

  validates_presence_of :title, :body, message: "Cannot be blank"
  validates_uniqueness_of :user_id, scoped_to: :movie_id


end

