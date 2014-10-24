class AddConfirmToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :confirm_token, :string
    add_column :identities, :confirm_sent_at, :datetime
    add_column :identities, :confirmed_at, :datetime
  end
end
