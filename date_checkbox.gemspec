# vim:ft=ruby:fileencoding=utf-8

require File.expand_path('../lib/date_checkbox/version.rb', __FILE__)

spec = Gem::Specification.new do |s|
  s.name = "date_checkbox"
  s.version = DateCheckbox::VERSION
  s.date = DateCheckbox::DATE
  s.summary = DateCheckbox::SUMMARY
  s.description = DateCheckbox::DESCRIPTION

  s.authors = ["Matthias Viehweger"]
  s.email = 'kronn@kronn.de'
  s.homepage = 'http://github.com/kronn/date_checkbox'
  s.rubyforge_project = '[none]' # to supress the warning

  s.require_paths = ["lib"]
  s.files = `git ls-files`.split("\n") - ['.gitignore']
  s.test_files = `git ls-files test`.split("\n")

  s.rdoc_options = ['--charset=utf-8', '--fmt=shtml', '--all']
  s.extra_rdoc_files = DateCheckbox::EXTRA_RDOC_FILES

  s.add_dependency 'rails', '~> 3.0.0'

  # for tests, needed
  s.add_development_dependency 'mocha'

  # for release and doc generation, more less optional
  s.add_development_dependency 'rdoc', '>= 2.4.2'
  s.add_development_dependency 'sdoc'
end
