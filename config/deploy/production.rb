require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
server '18.223.209.47', user: 'deploy', roles: %w{web app db}