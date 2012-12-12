require 'spec_helper'

describe BodyClassHelper, 'without any extra body classes' do
  describe "body_class with a normal controller" do
    before do
      controller = double('controller')
      controller.stub(:controller_path).and_return('widgets')
      controller.stub(:action_name).and_return('show')
      helper.stub(:controller).and_return controller
    end
    it "should return the correct names" do
      helper.body_class.should == "widgets widgets-show"
    end
  end
  describe "body_class with a nested controller" do
    before do
      controller = double('controller')
      controller.stub(:controller_path).and_return('module/widgets')
      controller.stub(:action_name).and_return('show')
      helper.stub(:controller).and_return controller
    end
    it "should return the correct names" do
      helper.body_class.should == "module-widgets module-widgets-show"
    end
  end
end

describe BodyClassHelper, 'with extra body classes' do
  before do
    controller = double('controller')
    controller.stub(:controller_path).and_return('widgets')
    controller.stub(:action_name).and_return('show')
    helper.stub(:controller).and_return controller
    helper.content_for(:extra_body_classes, 'extra_class')
  end
  it "adds extra body classes to the controller classes" do
    helper.body_class.should == 'widgets widgets-show extra_class'
  end
  it "adds extra body classes to the controller classes when #content_for= is called many times" do
    helper.content_for(:extra_body_classes, ' many extra classes')
    helper.body_class.should == 'widgets widgets-show extra_class many extra classes'
  end
end
