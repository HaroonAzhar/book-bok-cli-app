require "bundler/gem_tasks"
require "rspec/core/rake_task"


RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do
	puts "loaded environment"
	system("irb -r ./lib/book_box.rb")
end