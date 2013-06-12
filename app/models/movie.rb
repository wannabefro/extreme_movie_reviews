class Movie < ActiveRecord::Base
  attr_accessible :title, :year
  validates_uniqueness_of :title, :scope => :year
  validates_presence_of :title, :year
  validates_length_of :year, :is => 4, :message => 'Must be four digits'
end
