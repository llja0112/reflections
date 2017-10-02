class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :reflection_id
      t.integer :reviewer_id
      t.text :content

      t.timestamps
    end
    add_index :reviews, :reflection_id
    add_index :reviews, :reviewer_id
    add_index :reviews, [:reflection_id, :reviewer_id], unique: true
  end
end
