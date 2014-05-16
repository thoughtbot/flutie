require 'rails_helper'

describe PageTitleHelper, type: :helper do
  describe 'with no options' do
    subject { helper.page_title }
    it { should == 'Flutie' }
  end
  describe 'with a site name' do
    subject { helper.page_title(app_name: 'Test') }
    it { should == 'Test' }
  end
  describe 'with content for page title' do
    before { helper.content_for(:page_title, 'page title') }
    subject { helper.page_title }
    it { should == 'Flutie : page title' }
  end
  describe 'with content for page title, and an alternate separator' do
    before { helper.content_for(:page_title, 'page title') }
    subject { helper.page_title(separator: ' | ') }
    it { should == 'Flutie | page title' }
  end
  describe 'with an alternate symbol' do
    before { helper.content_for(:alt_page_title, 'page title') }
    subject { helper.page_title(page_title_symbol: :alt_page_title) }
    it { should == 'Flutie : page title' }
  end
  describe 'in a reversed position' do
    before { helper.content_for(:page_title, 'page title') }
    subject { helper.page_title(reverse: true) }
    it { should == 'page title : Flutie' }
  end
end
