require 'bundler'
include Rake::DSL
Bundler::GemHelper.install_tasks

require "rspec/core/rake_task" # RSpec 2.0

RSpec::Core::RakeTask.new(:unit) do |spec|
  #spec.pattern  = 'spec/*/*_spec.rb'
  spec.pattern = 'spec/unit/*_spec.rb'
  spec.rspec_opts = ['--backtrace']
end

RSpec::Core::RakeTask.new(:all) do |spec|
  spec.pattern = 'spec/*/*_spec.rb'
  spec.rspec_opts = ['--debug']
end

# this is for running tests that you've marked current...  eg:  it 'should work', :current => true do
RSpec::Core::RakeTask.new(:current) do |spec|
  spec.pattern = 'spec/*/*_spec.rb'
  spec.rspec_opts = ['--tag current']
end

RSpec::Core::RakeTask.new(:rename) do |spec|
  # This command will rename the gem to whatever is specified on the command line
  # File/ Folder renames:
  #  ruby_service_template.gemspec
  #  bin/ruby_service_template
  #  lib/ruby_service_template.rb
  #  lib/ruby_service_template
  
  # Strings to Rename:  
  # bin/ruby_service_template   Module Name...
  
  spec.pattern = 'spec/*/*_spec.rb'
  spec.rspec_opts = ['--tag current']
end


task :default => :all
