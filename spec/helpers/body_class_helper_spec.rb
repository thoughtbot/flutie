require "rails_helper"

describe BodyClassHelper, type: :helper do
  describe "a normal controller" do
    before do
      allow(helper).to receive(:controller).
        and_return(controller_double)
    end
    subject { helper.body_class }
    it { should == "widgets widgets-show" }
  end

  describe "a nested controller" do
    before do
      allow(helper).to receive(:controller).
        and_return(controller_double("modules/widgets"))
    end
    subject { helper.body_class }
    it { should == "modules-widgets modules-widgets-show" }
  end

  describe "extra body classes" do
    before do
      allow(helper).to receive(:controller).
        and_return(controller_double)
      helper.content_for(:extra_body_classes, "extra_class")
    end
    subject { helper.body_class }
    it { should == "widgets widgets-show extra_class" }

    describe "multiples times" do
      before do
        helper.content_for(:extra_body_classes, " many extra classes")
      end
      subject { helper.body_class }
      it { should == "widgets widgets-show extra_class many extra classes" }
    end
  end

  def controller_double(path = "widgets")
    double(
      :controller,
      controller_path: path,
      action_name: "show",
    )
  end
end
