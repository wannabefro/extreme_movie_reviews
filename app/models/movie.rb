class Movie < ActiveRecord::Base
  has_many :reviews

  attr_accessible :title, :year
  validates_uniqueness_of :title, :scope => :year, :message => 'Movie already created'
  validates_presence_of :title, :year, :message => "Invalid Criteria"
  validates :year, :inclusion => 1875..(Time.now.year + 1)



end




