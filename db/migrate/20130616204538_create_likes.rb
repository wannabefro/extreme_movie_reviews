class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :liked
      t.integer :likeable_id
      t.string :likeable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
