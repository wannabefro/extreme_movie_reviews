class AddIndexToReviews < ActiveRecord::Migration
  def up
    add_index :reviews, [:user_id, :movie_id], unique: true
  end

  def down
    remove_index :reviews, [:user_id, :movie_id]
  end
end
