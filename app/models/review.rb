class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  has_many :recent_reviews
  has_many :flags
  has_many :likes, as: :likeable

  attr_accessible :title, :body, :user, :movie

  validates_presence_of :title, :body, message: "Cannot be blank"
  validates_uniqueness_of :user_id, scoped_to: :movie_id

  state_machine :initial => :approved do

    event :flag do
      transition :approved => :flagged
    end

    event :approve do
      transition all => :approved
    end

    event :remove do
      transition :flagged => :removed
    end

  end


end

