set :application, "Silex-starterKit"
set :repository,  "git@github.com:rajibahmed/silex-starterKit.git"
set :branch,      ""

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#
set :sudo, false #for using deploy user not the root user
set :deploy_to, "/var/www/#{application}" #installation path on server
set :deploy_via, :remote_cache

set :domain,      "" #domain where application would be installed
set :user,        "" #set deploy user

role :web,        domain
role :app,        domain
role :db,         domain, :primary => true

ssh_options[:forward_agent] = true

set :shared_files,    ["app/config/parameters.yml", "web/.htaccess", "web/robots.txt"]
set :shared_children, ["app/logs"]


set :keep_releases, 3
