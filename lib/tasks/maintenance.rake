namespace :maintenance do
  MAINTENANCE_EXAMPLE = Rails.root.join "public/maintenance.html.example"
  MAINTENANCE_FILE = Rails.root.join "public/maintenance.html"

  desc "Start the maintenance mode"
  task :enable => :environment do
    if !File.exists? MAINTENANCE_FILE
      File.symlink MAINTENANCE_EXAMPLE, MAINTENANCE_FILE
    end
    Rails.logger.info("[MAINTENANCE] App is now DOWN")
  end

  desc "Stop the maintenance mode"
  task :disable => :environment do
    if File.exists? MAINTENANCE_FILE
      File.unlink MAINTENANCE_FILE
    end
    Rails.logger.info "[MAINTENANCE] App is now UP"
  end
end
