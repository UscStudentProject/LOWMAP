# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'rails101s'
set :repo_url, 'git@github.com:p988744/rails101s.git'


# rbenv 的設定

set :rbenv_type, :user 
set :rbenv_ruby, "2.2.3"
set :rbenv_path, "/usr/local/rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all 


# deploy 的資料夾位置 (prodution)

set :deploy_to, "/home/apps/rails101s"

set :log_level, :debug

# git clone 完成後會從 shared 資料夾 copy 過去的檔案

set :linked_files, %w(config/database.yml config/secrets.yml) 

# git clone 完成後會從 shared 資料夾 copy 過去的資料夾

set :linked_dirs, fetch(:linked_dirs, []).push("bin", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system") 


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
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
