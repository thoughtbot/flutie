require 'test_helper'

class ApplicationController < ActionController::Base
end

require "flutie/styleguides_controller"
require File.join(File.dirname(__FILE__), '..', '..', 'config', 'flutie_routes')

class Flutie::StyleguidesControllerTest < ActionController::TestCase

  context "on GET to /styleguides/show" do
    setup { get :show }

    should_respond_with    :success
    should_render_template :show
  end

end
