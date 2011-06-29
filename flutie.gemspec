Gem::Specification.new do |s|
  s.name = 'flutie'
  s.version = '1.2.2'
  s.date = %q{2010-06-29}
  s.email = 'support@thoughtbot.com'
  s.homepage = 'http://github.com/thoughtbot/flutie'
  s.summary = 'Flutie adds default stylesheets to web apps'
  s.description = 'Flutie is a starting point for personal discovery'
  s.files = ["README*", "Rakefile", "{app,config,lib,public}/**/*"].map { |glob| Dir[glob] }.flatten
  s.authors = ['Chad Pytel', 'Kevin Burg', 'Matt Jankowski', 'Mike Burns', 'Fred Yates']
  s.add_development_dependency('sass')
  s.add_development_dependency('rails', '3.0.8')
end
