class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.integer :review_id, null: false
      t.string :reason, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
