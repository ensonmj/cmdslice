class GenerateProfileForUsers < ActiveRecord::Migration
  def up
    User.all.each do |u|
      u.profile_attributes = { email: u.email }
      u.save!
    end
  end

  def down
    Profile.delete_all
  end
end
