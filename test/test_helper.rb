ENV['RAILS_ENV'] = 'test'

require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'action_controller'
require 'test_help'
require 'flutie'
require 'config/flutie_expansion'
require 'rexml/document'

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'app', 'controllers')

require 'shoulda'
require 'shoulda/rails'
begin require 'redgreen'; rescue LoadError; end
