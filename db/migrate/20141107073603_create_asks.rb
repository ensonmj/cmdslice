class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.string :title
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
