# encoding: utf-8

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Flutie'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

gem_spec = Gem::Specification.new do |gem_spec|
  gem_spec.name        = "flutie"
  gem_spec.version     = "1.0"
  gem_spec.summary     = "style defaults"
  gem_spec.email       = "support@thoughtbot.com"
  gem_spec.homepage    = "http://github.com/thoughtbot/flutie"
  gem_spec.description = "Rails authentication with email & password."
  gem_spec.authors     = ["thoughtbot"]
  gem_spec.files       = FileList["[A-Z]*", "{app,config,lib,rails}/**/*"]
end

desc "Generate a gemspec file"
task :gemspec do
  File.open("#{gem_spec.name}.gemspec", 'w') do |f|
    f.write gem_spec.to_yaml
  end
end
