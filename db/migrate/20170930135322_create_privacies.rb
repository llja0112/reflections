class CreatePrivacies < ActiveRecord::Migration[5.0]
  def change
    create_table :privacies do |t|
      t.integer :reflection_id
      t.integer :authorised_personal_id

      t.timestamps

    end
    add_index :privacies, :reflection_id
    add_index :privacies, :authorised_personal_id
    add_index :privacies, [:reflection_id, :authorised_personal_id], unique: true
  end
end
