# config valid only for current version of Capistrano
lock '3.4.0'

set :restart_webserver, ask("\nDo you want to restart apache web server (Y/N(default)) ?", "N")
restart_webserver = fetch(:restart_webserver).upcase
restart_webserver = restart_webserver != "N" ? true : false

set :assets_switch, ask("\ndo you want compile assets? (Y/N default : N)", "N")
assets_switch = fetch(:assets_switch).upcase

set :application, "wimihyang"

which_app = fetch(:stage).to_s
if which_app == "production"
  set :branch, :production
  set :rails_env, "production"
else
  set :branch, :master
  set :rails_env, "staging"
end
set :rbenv_custom_path, "/home/jskim/.rbenv"

set :repo_url, "git@github.com:honeyl3oom/wemehyang.git"
set :deploy_to, "/home/jskim/rails-app/#{fetch(:application)}/#{fetch(:rails_env)}"
set :deploy_user, "jskim"
set :pty, false

set :rbenv_ruby, "2.2.3"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

set :keep_releases, 5


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  namespace :assets do
    Rake::Task['deploy:assets:precompile'].clear_actions

    if assets_switch == "Y"
      desc 'Precompile assets locally and upload to servers'
      task :precompile do
        on roles(fetch(:assets_roles)) do
          run_locally do
            execute "bin/rake assets:precompile RAILS_ENV=#{fetch(:rails_env)}"
          end
   
          within release_path do
            with rails_env: fetch(:rails_env) do
              old_manifest_path = "#{shared_path}/public/assets/.sprockets-manifest*"
              execute :rm, old_manifest_path if test "[ -f #{old_manifest_path} ]"
              upload!('./public/assets/', "#{shared_path}/public/", recursive: true)
            end
          end
          #run_locally { execute 'rm -rf public/assets' }
        end
      end
    end
  end

  desc "Makes sure local git is in sync with remote."
  task :check_revision do
    unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
      puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
      puts "Run `git push` to sync changes."
      exit
    end
  end

  task :restart_server do
    on roles(:app) do
      if restart_webserver
        execute "sudo apache2ctl restart"
      else
        execute "passenger-config restart-app /"
      end
    end
  end

  before :deploy, "deploy:check_revision"
  after "deploy:updating", "setup:symlink_config"
  after :deploy, "deploy:restart_server"
  after :rollback, "deploy:restart_server"
end
