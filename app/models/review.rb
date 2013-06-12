class Review < ActiveRecord::Base

  attr_accessible :title, :body

  validates_presence_of :title, :body, message: "Cannot be blank"

end