class Movie < ActiveRecord::Base
  attr_accessible :title, :year
  validates_uniqueness_of :title, :scope => :year, :message => 'Movie already created'
  validates_presence_of :title, :year, :message => "Invalid Criteria"
  validates_length_of :year, :is => 4, :message => 'Must be four digits'
end
