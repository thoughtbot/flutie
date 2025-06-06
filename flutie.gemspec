$LOAD_PATH << File.expand_path('lib', __dir__)
require 'flutie/version'

Gem::Specification.new do |s|
  s.name = 'flutie'
  s.version = Flutie::VERSION.dup
  s.licenses = ['MIT']
  s.authors = <<-AUTHORS.split("\n")
    Aaron Suggs
    Caleb Thompson
    Chad Mazzola
    Chad Pytel
    Dan Croak
    Edwin Morris
    Emilien Taque
    Fred Yates
    Gabe Berke-Williams
    Galen Frechette
    Greg Sterndale
    J. Edward Dewyea
    Joe Ferris
    Kevin Burg
    Matt Jankowski
    Matthew Burket
    Mike Burns
    Nick Quaranto
    OZAWA Sakuro
    Phil LaPier
    Tom Crinson
  AUTHORS

  s.email = ['support@thoughtbot.com']
  s.homepage = 'http://github.com/thoughtbot/flutie'
  s.summary = 'Flutie provides extra Rails view helpers'
  s.description = 'Flutie is a starting point for personal discovery'

  s.files = `git ls-files -z`
            .split("\x0")
            .reject { |f| f =~ %r{^(spec|gemfiles|bin)/} }
  s.require_paths = ['lib']

  s.add_development_dependency('appraisal')
  s.add_development_dependency('rspec-rails', '~> 3.7')
  s.add_development_dependency('sqlite3', '~> 1.3')

  s.required_ruby_version = '>= 3.0'
end
