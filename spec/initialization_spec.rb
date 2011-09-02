require 'spec_helper'

describe "initialize the rails app" do
  it "should add flutie directory to stylesheet expansion" do
    expected = { :flutie => ['/flutie/stylesheets/flutie'] }
    ActionView::Helpers::AssetTagHelper.send(:class_variable_get, :@@stylesheet_expansions).should == expected
  end
end
