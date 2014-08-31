class AddUserIdToSlices < ActiveRecord::Migration
  def change
    add_reference :slices, :user, index: true
  end
end
