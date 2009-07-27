require 'test_helper'

class ApplicationController < ActionController::Base
end

ActionController::Base.prepend_view_path File.join(File.dirname(__FILE__), '..', '..', 'app', 'views')
require "flutie/styleguides_controller"
require File.join(File.dirname(__FILE__), '..', '..', 'config', 'flutie_routes')

class Flutie::StyleguidesControllerTest < ActionController::TestCase

  context "on GET to /styleguides/show" do
    setup { get :show }

    should_respond_with       :success
    should_render_template    :show
    should_render_without_layout
  end

  context "on GET to /styleguides/show with flutie=false" do
    setup { get :show, :flutie => "false" }

    should_respond_with       :success
    should_render_template    :show
    should_render_without_layout
  end

  context "on GET to /styleguides/show with flutie=true" do
    setup { get :show, :flutie => "true" }

    should_respond_with       :success
    should_render_template    :show
    should_render_with_layout :flutie
  end

end
