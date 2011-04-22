require 'rubygems'
require 'sinatra'

set :views, ['app/views']
set :static, true

helpers do
  def stylesheet_link_tag(name)
    "<link href='/stylesheets/#{name}.css' media='all' rel='Stylesheet' type='text/css' />"
  end
end

get '/' do
  erb :"flutie/styleguides/show", :layout => :"layouts/flutie"
end
