namespace :user do
  desc "Rebuild auth_token for users"
  task :rebuild_auth_token => :environment do
    User.trasaction do
      User.all.each do |user|
        user.generate_token(:auth_token)
        u.save!
      end
    end
  end
end
