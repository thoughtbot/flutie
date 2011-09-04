require 'spec_helper'

describe PageTitleHelper do
  describe "#page_title with no options" do
    subject { helper.page_title }
    it { should == "Dummy" }
  end
  describe "#page_title with site name" do
    subject { helper.page_title(:app_name => 'Test') }
    it { should == "Test" }
  end
  describe "#page_title with content for page title" do
    before { helper.content_for(:page_title, 'page title') }
    subject { helper.page_title }
    it { should == "Dummy : page title" }
  end
  describe "#page_title with content for page title and alternate separator" do
    before { helper.content_for(:page_title, 'page title') }
    subject { helper.page_title(:separator => ' | ') }
    it { should == "Dummy | page title" }
  end
  describe "#page_title with content for alternate symbol" do
    before { helper.content_for(:alt_page_title, 'page title') }
    subject { helper.page_title(:page_title_symbol => :alt_page_title) }
    it { should == "Dummy : page title" }
  end
end
