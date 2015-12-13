namespace :setup do
  desc "Seed the database."
  task :seed_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end

  desc "Symlinks config files"
  task :symlink_config do
    on roles(:app) do
      execute "ln -nfs /home/jskim/rails-app/wimihyang/shared/config/database.yml #{release_path}/config/database.yml"
      execute "ln -nfs /home/jskim/rails-app/wimihyang/shared/config/secrets.yml #{release_path}/config/secrets.yml"
      execute "ln -nfs /home/jskim/rails-app/wimihyang/shared/config/application.yml #{release_path}/config/application.yml"
      execute "rm -rf #{release_path}/public/uploads"
      execute "ln -nfs /home/jskim/rails-app/wimihyang/web_data/#{fetch(:rails_env)} #{release_path}/public/uploads"
      
      execute "ln -nfs #{current_path}/config/#{fetch(:application)}_#{fetch(:rails_env)}_vhosts.conf /etc/apache2/sites-enabled/#{fetch(:application)}_#{fetch(:rails_env)}"
   end
  end
end
