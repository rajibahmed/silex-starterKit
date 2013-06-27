require 'rubygems'
require 'railsless-deploy'  #loades Capistrano2
load 'config/deploy'       # remove this line to skip loading any of the default tasks

#set :stages, %w( dev staging production )
#set :default_stage, "dev"
#require 'capistrano/ext/multistage'



namespace :backup do

  desc "will create a SQL file to a secure place"
  task :db do
    puts "backup db "
  end

end

namespace :composer do

  desc "Install application dependencies"
  task :install do
    run "cd #{current_path} && composer.phar install"
  end

  desc "Update application dependencies"
  task :update do
    set(:update_by , Capistrano::CLI.ui.ask(" ie. ztorm/zapi: "))
    update_by = "-v" if update_by.nil?
    run "cd #{current_path} && composer.phar update #{update_by}"
    run "cd #{current_path} && composer.phar dump-autoload -o"
  end

  desc "Copy from last revision"
  task :copy do
    #run " cd #{current_release} && chmod -R 775 . "

    unless previous_release.nil?
      run "cp -R #{previous_release}/vendor/* #{current_release}/vendor "
      run "cp #{previous_release}/config/prod.php    #{current_release}/config "
      run "cp #{previous_release}/config/console    #{current_release}/config "
      run "rm #{current_release}/public/index_dev.php #{current_release}/composer.json "
      run "mkdir #{current_release}/cache && chmod -R 777 #{current_release}/cache "
      run "mkdir #{current_release}/public/assets && chmod -R 755 #{current_release}/public/assets"
      run "cp #{previous_release}/public/.htaccess #{current_release}/public/ "
      run "cp #{current_release}/REVISION #{current_release}/public/hash.txt"
    end
  end


  desc "Admin install php packages"
  task :notify do
    puts "================================================"
    puts "= Run composer:install to load php packages    ="
    puts "================================================"
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

after 'deploy:setup', "composer:notify"
after "deploy:finalize_update", "composer:copy" , "assetic:dump"
