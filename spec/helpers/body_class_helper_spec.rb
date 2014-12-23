require 'rails_helper'

describe BodyClassHelper, 'without any extra body classes', type: :helper do
  describe "body_class with a normal controller" do
    before do
      controller = double('controller', controller_path: 'widgets', action_name: 'show')
      allow(helper).to receive(:controller).and_return(controller)
    end
    it "should return the correct names" do
      expect(helper.body_class).to eq "widgets widgets-show"
    end
  end
  describe "body_class with a nested controller" do
    before do
      controller = double('controller', controller_path: 'module/widgets', action_name: 'show')
      allow(helper).to receive(:controller).and_return(controller)
    end
    it "should return the correct names" do
      expect(helper.body_class).to eq "module-widgets module-widgets-show"
    end
  end
end

describe BodyClassHelper, 'with extra body classes', type: :helper do
  before do
    controller = double('controller', controller_path: 'widgets', action_name: 'show')
    allow(helper).to receive(:controller).and_return(controller)
    helper.content_for(:extra_body_classes, 'extra_class')
  end
  it "adds extra body classes to the controller classes" do
    expect(helper.body_class).to eq 'widgets widgets-show extra_class'
  end
  it "adds extra body classes to the controller classes when #content_for= is called many times" do
    helper.content_for(:extra_body_classes, ' many extra classes')
    expect(helper.body_class).to eq 'widgets widgets-show extra_class many extra classes'
  end
end
