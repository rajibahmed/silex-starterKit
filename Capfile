require 'rubygems'
require 'railsless-deploy'  #loades Capistrano2
load 'config/deploy'       # remove this line to skip loading any of the default tasks

#set :stages, %w( dev staging production )
#set :default_stage, "dev"
#require 'capistrano/ext/multistage'


namespace :composer do

  desc "Install application dependencies"
  task :install do
    run "cd #{current_path} && composer.phar install"
  end

  desc "Update application dependencies"
  task :update do
    set(:update_by , Capistrano::CLI.ui.ask(" ie. silex: "))
    update_by = "-v" if update_by.nil?
    run "cd #{current_path} && composer.phar update #{update_by}"
    run "cd #{current_path} && composer.phar dump-autoload -o"
  end

  desc "Copy from last revision"
  task :copy do
    unless previous_release.nil?
      run "cp -R #{previous_release}/vendor #{current_release}/ "
      run "cp #{previous_release}/config/prod.php    #{current_release}/config "
      run "mkdir #{current_release}/cache && chmod -R 775 #{current_release}/cache "
      run "cp #{current_release}/REVISION #{current_release}/public/hash.txt"
	else
		composer.install # install libs on first deployment
    end
  end


  desc "Remove installed libraries"
  task :cleanup do
    ["composer.lock","vendor/*"].each do |remove_files|
      run "rm -rf #{current_path}/#{remove_files}"
      puts "====> Removed #{remove_files}"
    end
  end

end

namespace :assetic do
  desc "Dump assets"
  task :dump do
    run "cd #{current_release} && ./config/console assetic:dump"
  end
end

after "deploy:finalize_update", "composer:copy" 
