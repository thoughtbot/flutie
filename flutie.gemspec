Gem::Specification.new do |s|
  s.name = 'flutie'
  s.version = '1.2.5'
  s.date = %q{2011-09-04}
  s.email = 'support@thoughtbot.com'
  s.homepage = 'http://github.com/thoughtbot/flutie'
  s.summary = 'Flutie adds default stylesheets to web apps'
  s.description = 'Flutie is a starting point for personal discovery'
  s.files = Dir["{app,config,lib,public}/**/*"] + ["LICENSE", "Rakefile", "Gemfile", "README.md"]
  s.authors = ['Matt Jankowski', 'Chad Pytel', 'Kevin Burg', 'Chad Mazzola', 'Phil LaPier', 'Dan Croak', 'Fred Yates', 'OZAWA Sakuro', 'Mike Burns', 'Greg Sterndale', 'Joe Ferris', 'J. Edward Dewyea', 'Emilien Taque', 'Aaron Suggs', 'Nick Quaranto']
  s.add_development_dependency('sass')
  s.add_development_dependency('rails', '3.0.10')
end
