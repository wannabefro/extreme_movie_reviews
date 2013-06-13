class Review < ActiveRecord::Base
  belongs_to :movie

  attr_accessible :title, :body, :movie_id

  validates_presence_of :title, :body, message: "Cannot be blank"

end