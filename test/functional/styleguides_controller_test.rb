require 'test_helper'

class ApplicationController < ActionController::Base
end

ActionController::Base.prepend_view_path File.join(File.dirname(__FILE__), '..', '..', 'app', 'views')
require "flutie/styleguides_controller"
require File.join(File.dirname(__FILE__), '..', '..', 'config', 'flutie_routes')

class Flutie::StyleguidesControllerTest < ActionController::TestCase
  def self.should_render_well_formed_xml
    should "render well-formed XML" do
      assert_nothing_raised("expected a well-formed XML document") do
        REXML::Document.new(@response.body)
      end
    end
  end

  context "on GET to /styleguides/show" do
    setup { get :show }

    should_respond_with       :success
    should_render_template    :show
    should_render_without_layout
    should_render_well_formed_xml
  end

  context "on GET to /styleguides/show with flutie=false" do
    setup { get :show, :flutie => "false" }

    should_respond_with       :success
    should_render_template    :show
    should_render_without_layout
    should_render_well_formed_xml
  end

  context "on GET to /styleguides/show with flutie=true" do
    setup { get :show, :flutie => "true" }

    should_respond_with       :success
    should_render_template    :show
    should_render_with_layout :flutie
    should_render_well_formed_xml
  end
end
