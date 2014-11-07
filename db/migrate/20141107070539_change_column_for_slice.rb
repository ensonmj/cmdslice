class ChangeColumnForSlice < ActiveRecord::Migration
  def up
    rename_column :slices, :text, :body
    change_column :slices, :body, :text, limit: nil
    change_column :slices, :note, :text, limit: nil
  end

  def down
    change_column :slices, :note, :string
    change_column :slices, :body, :string
    rename_column :slices, :body, :text
  end
end
