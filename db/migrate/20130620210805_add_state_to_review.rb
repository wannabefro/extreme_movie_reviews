class AddStateToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :state, :string
  end
end
