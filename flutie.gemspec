# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'flutie/version'

Gem::Specification.new do |s|
  s.name        = 'flutie'
  s.version     = Flutie::VERSION.dup
  s.licenses    = ['MIT']
  s.authors     = ['Matt Jankowski', 'Chad Pytel', 'Kevin Burg', 'Chad Mazzola', 'Phil LaPier', 'Dan Croak', 'Mike Burns', 'Fred Yates', 'OZAWA Sakuro', 'Gabe Berke-Williams', 'Caleb Thompson', 'Greg Sterndale', 'Matthew Burket', 'Joe Ferris', 'Edwin Morris', 'Tom Crinson', 'Emilien Taque', 'Galen Frechette', 'J. Edward Dewyea', 'Nick Quaranto', 'Aaron Suggs']

  s.email       = ['support@thoughtbot.com']
  s.homepage    = 'http://github.com/thoughtbot/flutie'
  s.summary     = 'Flutie provides extra Rails view helpers'
  s.description = 'Flutie is a starting point for personal discovery'

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f =~ %r(^(spec|gemfiles|bin)/) }
  s.require_paths = ['lib']

  s.add_development_dependency('appraisal', '~> 2.2')
  s.add_development_dependency('sqlite3', '~> 1.3')
  s.add_development_dependency('rspec-rails', '~> 3.7')
end
