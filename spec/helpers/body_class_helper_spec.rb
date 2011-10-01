require 'spec_helper'

describe BodyClassHelper, 'without any extra body classes' do
  describe "body_class with a normal controller" do
    before do
      controller = mock
      controller.stubs(:controller_path).returns('widgets')
      controller.stubs(:action_name).returns('show')
      helper.stubs(:controller).returns controller
    end
    it "should return the correct names" do
      helper.body_class.should == "widgets widgets-show"
    end
  end
  describe "body_class with a nested controller" do
    before do
      controller = mock
      controller.stubs(:controller_path).returns('module/widgets')
      controller.stubs(:action_name).returns('show')
      helper.stubs(:controller).returns controller
    end
    it "should return the correct names" do
      helper.body_class.should == "module-widgets module-widgets-show"
    end
  end
end

describe BodyClassHelper, 'with extra body classes' do
  before do
    controller = mock
    controller.stubs(:controller_path).returns('widgets')
    controller.stubs(:action_name).returns('show')
    helper.stubs(:controller).returns controller
    helper.content_for(:extra_body_classes, 'extra_class')
  end
  it "adds extra body classes to the controller classes" do
    helper.body_class.should == 'widgets widgets-show extra_class'
  end
end
