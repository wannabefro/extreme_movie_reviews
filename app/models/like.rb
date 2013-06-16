class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true
  attr_accessible :user_id, :liked
end
