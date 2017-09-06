class AddPrivacyToReflections < ActiveRecord::Migration[5.0]
  def change
    add_column :reflections, :privacy, :integer, default: 0
  end
end
