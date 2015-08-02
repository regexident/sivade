require 'bundler/gem_tasks'

require 'rake/extensiontask'

task :build => :compile

Rake::ExtensionTask.new('sivade') do |ext|
  ext.lib_dir = 'lib/sivade'
end
