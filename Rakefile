require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec do |t|
  t.pattern = "spec/**/*_spec.rb"
  t.ruby_opts = "-I lib"
  t.rspec_opts = "-f d"
end

task :default => :spec

