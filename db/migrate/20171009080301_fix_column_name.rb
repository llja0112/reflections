class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :first_name, :name
    remove_column :users, :last_name
  end
end
