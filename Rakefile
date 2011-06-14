require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'sdoc'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the date_checkbox plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the date_checkbox plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  require File.expand_path('../lib/date_checkbox/version', __FILE__)

  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.title    = "DateCheckbox #{DateCheckbox::VERSION}"
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.options << '--charset=utf-8'
  rdoc.options << '--fmt=shtml'

  DateCheckbox::EXTRA_RDOC_FILES.each do |file|
    rdoc.rdoc_files.include(file)
  end
  rdoc.rdoc_files.include('lib/**/*.rb')
end
