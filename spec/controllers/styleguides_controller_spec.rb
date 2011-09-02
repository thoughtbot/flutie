require 'spec_helper'

ActionController::Base.prepend_view_path File.join(File.dirname(__FILE__), '..', '..', 'app', 'views')
ActionController::Base.prepend_view_path File.join(File.dirname(__FILE__), '..', 'fixtures', 'app', 'views')

shared_examples_for "Renders valid XML" do
  it "should render valid xml" do
    lambda { REXML::Document.new(response.body) }.should_not raise_error
  end
end

shared_examples_for "Renders styleguide partials" do
  it "should render styleguide partials" do
    response.body.should =~ %r{fixture partial 1}
    response.body.should =~ %r{fixture partial 2}
  end
end

shared_examples_for "Renders application layout" do
  it "should use application layout" do
    response.should render_template('layouts/application')
  end
end

shared_examples_for "Responds with success and renders show template" do
  it "should respond with success and render show template" do
    response.should be_success
    response.should render_template(:show)
  end
end

describe Flutie::StyleguidesController do

  render_views

  describe "GET to /styleguides/show" do
    before { get :show }
    it_should_behave_like "Responds with success and renders show template"
    it_should_behave_like "Renders valid XML"
    it_should_behave_like "Renders styleguide partials"
    it_should_behave_like "Renders application layout"
  end

  describe "GET to /styleguides/show with flutie=false" do
    before { get :show, :flutie => "false" }
    it_should_behave_like "Responds with success and renders show template"
    it_should_behave_like "Renders valid XML"
    it_should_behave_like "Renders styleguide partials"
    it_should_behave_like "Renders application layout"
  end

  describe "GET to /styleguides/show with flutie=true" do
    before { get :show, :flutie => "true" }
    it_should_behave_like "Responds with success and renders show template"
    it_should_behave_like "Renders valid XML"
    it_should_behave_like "Renders styleguide partials"
    it "should use flutie layout" do
      response.should render_template('layouts/flutie')
    end
  end

end
