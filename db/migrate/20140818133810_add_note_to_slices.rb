class AddNoteToSlices < ActiveRecord::Migration
  def change
    add_column :slices, :note, :string
  end
end
