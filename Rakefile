require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

#task :default => :spec

task :environment do
  require_relative './config/environment'
end

desc 'load all files'
task :reload => :environment do
  load_all './lib'
end

desc 'drop into the Pry console'
task :console => :environment do
  Pry.start
end
