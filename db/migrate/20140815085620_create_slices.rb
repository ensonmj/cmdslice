class CreateSlices < ActiveRecord::Migration
  def change
    create_table :slices do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
