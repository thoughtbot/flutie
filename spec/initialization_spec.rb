require 'spec_helper'

describe "initialize the rails app" do
  let(:expected) { { :flutie => ['/flutie/stylesheets/flutie'] } }
  if defined?(ActionView::Helpers::AssetTagHelper::StylesheetIncludeTag)
    it "should add flutie directory to the stylesheet include tag expansions" do
      ActionView::Helpers::AssetTagHelper::StylesheetIncludeTag.expansions.should == expected
    end
  else
    it "should add flutie directory to stylesheet expansion" do
      expected = { :flutie => ['/flutie/stylesheets/flutie'] }
      ActionView::Helpers::AssetTagHelper.send(:class_variable_get, :@@stylesheet_expansions).should == expected
    end
  end
end

