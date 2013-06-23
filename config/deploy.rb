set :application, "starterKit"
set :repository,  "git@github.com:rajibahmed/silex-starterKit.git"
set :branch,      ""

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#
set :deploy_to, "/home/rajib/Sites/php/#{application}" #installation path on server
set :deploy_via, :copy

set :domain,    "" #domain where application would be installed
set :user,      "rajib" #set deploy user
set :sudo,      false #for using deploy user not the root user

role :web,        domain
role :app,        ""
role :db,         domain, :primary => true

ssh_options[:forward_agent] = true

set :shared_files,    ["app/config/parameters.yml", "web/.htaccess", "web/robots.txt"]
set :shared_children, ["app/logs"]


set :keep_releases, 3
