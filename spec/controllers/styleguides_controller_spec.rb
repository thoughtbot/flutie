require 'spec_helper'

ActionController::Base.prepend_view_path File.join(File.dirname(__FILE__), '..', '..', 'app', 'views')
ActionController::Base.prepend_view_path File.join(File.dirname(__FILE__), '..', 'fixtures', 'app', 'views')

describe Flutie::StyleguidesController do

  render_views

  describe "GET to /styleguides/show" do
    before { get :show }
    it "should respond with success and render template" do
      response.should be_success
      response.should render_template(:show)
    end
    it "should use application layout" do
      response.should render_template('layouts/application')
    end
    it "should render valid xml" do
      lambda { REXML::Document.new(response.body) }.should_not raise_error
    end
    it "should render styleguide partials" do
      response.body.should =~ %r{fixture partial 1}
      response.body.should =~ %r{fixture partial 2}
    end
  end

  describe "GET to /styleguides/show with flutie=false" do
    before { get :show, :flutie => "false" }
    it "should respond with success and render template" do
      response.should be_success
      response.should render_template(:show)
    end
    it "should use application layout" do
      response.should render_template('layouts/application')
    end
    it "should render valid xml" do
      lambda { REXML::Document.new(response.body) }.should_not raise_error
    end
    it "should render styleguide partials" do
      response.body.should =~ %r{fixture partial 1}
      response.body.should =~ %r{fixture partial 2}
    end
  end

  describe "GET to /styleguides/show with flutie=true" do
    before { get :show, :flutie => "true" }
    it "should respond with success and render template" do
      response.should be_success
      response.should render_template(:show)
    end
    it "should use flutie layout" do
      response.should render_template('layouts/flutie')
    end
    it "should render valid xml" do
      lambda { REXML::Document.new(response.body) }.should_not raise_error
    end
    it "should render styleguide partials" do
      response.body.should =~ %r{fixture partial 1}
      response.body.should =~ %r{fixture partial 2}
    end
  end

end
