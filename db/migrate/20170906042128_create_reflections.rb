class CreateReflections < ActiveRecord::Migration[5.0]
  def change
    create_table :reflections do |t|
      t.string :title
      t.text :story
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
