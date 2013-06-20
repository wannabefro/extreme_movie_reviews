class Flag < ActiveRecord::Base
  attr_accessible :reason, :review, :user

  belongs_to :review
  belongs_to :user
end
