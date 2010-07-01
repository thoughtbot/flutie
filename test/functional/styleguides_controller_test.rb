require 'test_helper'

ActionController::Base.prepend_view_path File.join(File.dirname(__FILE__), '..', '..', 'app', 'views')
ActionController::Base.prepend_view_path File.join(File.dirname(__FILE__), '..', 'fixtures', 'app', 'views')

class Flutie::StyleguidesControllerTest < ActionController::TestCase
  def self.should_render_well_formed_xml
    should "render well-formed XML" do
      assert_nothing_raised("expected a well-formed XML document") do
        REXML::Document.new(@response.body)
      end
    end
  end

  def self.should_render_all_styleguide_partials
    should "render the partials in the fixtures directory" do
      assert_match %r{fixture partial 1}, @response.body
      assert_match %r{fixture partial 2}, @response.body
    end
  end

  context "on GET to /styleguides/show" do
    setup { get :show }

    should respond_with       :success
    should render_template    :show
    should "not have a layout" do
      assert_template :layout => nil, :partial => '_one', :count => 1
    end
    should_render_well_formed_xml
    should_render_all_styleguide_partials
  end

  context "on GET to /styleguides/show with flutie=false" do
    setup { get :show, :flutie => "false" }

    should respond_with       :success
    should render_template    :show
    should "not have a layout" do
      assert_template :layout => nil, :partial => '_one', :count => 1
    end
    should_render_well_formed_xml
    should_render_all_styleguide_partials
  end

  context "on GET to /styleguides/show with flutie=true" do
    setup { get :show, :flutie => "true" }

    should respond_with       :success
    should render_template    :show
    should "have a layout of flutie" do
      assert_template :layout => 'flutie', :partial => '_one', :count => 1
    end
    should_render_well_formed_xml
    should_render_all_styleguide_partials
  end
end
