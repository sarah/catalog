#############################################################
#	Application
#############################################################

set :application, "catalogofthingsthatdontexist.com"
set :deploy_to, "/home/sarah/public_html/#{application}"
set :current_path, "#{deploy_to}/current"


#############################################################
#	SVN
#############################################################

set :svn_user, "fabled"
set :svn_password, "svn5163"
set :svn_app_name, "catalog"
set :repository, Proc.new{"--username #{svn_user} --password #{svn_password} https://svn2.hosted-projects.com/#{svn_user}/#{svn_app_name}"}

#############################################################
#	Settings
#############################################################
default_run_options[:pty] = true
set :user_sudo, true


#############################################################
#	Servers
#############################################################

set :user, "sarah"
ssh_options[:port] = 7315
# set :port, 7315


# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, application
role :web, application
role :db,  application, :primary => true

#############################################################
#	Passenger
#############################################################

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
    run "ln -nfs #{shared_path}/system/uploads #{release_path}/public/uploads"
  end
end

after :deploy, "passenger:restart"
deploy.task :start do
  # nothing
end
deploy.task :restart do
  # nothing
end

after "deploy", "deploy:cleanup"
after "deploy:migrations", "deploy:cleanup"
