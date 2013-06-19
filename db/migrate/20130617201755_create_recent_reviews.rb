class CreateRecentReviews < ActiveRecord::Migration
  def change
    create_table :recent_reviews do |t|
      t.integer 'user_id'
      t.integer 'review_id'

      t.timestamps
    end
  end
end
