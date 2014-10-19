# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'codeslice'
set :repo_url, 'git@github.com:ensonmj/codeslice.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/codeslice'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true
set :use_sudo, false

# Default value for :linked_files is []
# database.yml linked by capistrano-postgresql
# secrets.yml linkeg by capistrano-secrets-yml
#set :linked_files, %w{config/database.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# rbenv overrides defaults
set :rbenv_ruby, '2.1.2'

# puma overrides defaults
set :puma_threads, [0, 16]
set :puma_workers, 0
set :puma_init_active_record, true # using ActiveRecord

namespace :db do
  desc "Runs rake db:seed"
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        within rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end
end

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # ------------ self defined task sequence ---------------
  after :publishing, :restart
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  after :finishing, :compile_assets
  after :finishing, :cleanup
  after :finishing, :restart
  after :finished, :notify do
    system("\\say Capistrano deployment completed! Good Job!")
  end
end
