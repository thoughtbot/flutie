Gem::Specification.new do |s|
  s.name = 'flutie'
  s.version = '1.1.8'
  s.date = %q{2010-12-01}
  s.email = 'support@thoughtbot.com'
  s.homepage = 'http://github.com/thoughtbot/flutie'
  s.summary = 'Flutie adds default stylesheets to web apps'
  s.description = 'Flutie is a starting point for personal discovery'
  s.files = ["README*", "Rakefile", "{app,config,lib,vendor}/**/*"].map { |glob| Dir[glob] }.flatten
  s.authors = ['Chad Pytel', 'Kevin Burg', 'Matt Jankowski', 'Mike Burns', 'Fred Yates']
  s.add_development_dependency('haml')
end
