Gem::Specification.new do |s|
  s.name = 'flutie'
  s.version = '1.2.3'
  s.date = %q{2011-09-02}
  s.email = 'support@thoughtbot.com'
  s.homepage = 'http://github.com/thoughtbot/flutie'
  s.summary = 'Flutie adds default stylesheets to web apps'
  s.description = 'Flutie is a starting point for personal discovery'
  s.files = Dir["{app,config,lib,public}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README*"]
  s.authors = ['Chad Pytel', 'Kevin Burg', 'Matt Jankowski', 'Mike Burns', 'Fred Yates']
  s.add_development_dependency('sass')
  s.add_development_dependency('rails', '3.0.10')
end
