class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  attr_accessible :title, :body, :movie_id, :user_id, :user, :movie

  validates_presence_of :title, :body, message: "Cannot be blank"
  validates_uniqueness_of :user_id, scoped_to: :movie_id


end

