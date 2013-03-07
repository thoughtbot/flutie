require 'spec_helper'

describe TimestampHelper, '#timestamp' do
  it 'creates a time tag with a datetime and the relative date' do
    time = 10.minutes.ago

    tag = Capybara.string(timestamp(time)).find('time')

    tag.should have_content(time_ago_in_words(time))
    tag[:title].should eq(l(time))
    tag[:datetime].should eq(time.to_s)
  end

  context 'with optional arguments' do
    it 'uses tag rather than a <time>' do
      tag = Capybara.string timestamp(1.minute.ago, :tag => :span)

      tag.should have_css('span')
    end

    it 'skips the title attribute when :title => false' do
      tag = Capybara.string timestamp(1.minute.ago, :title => false)

      tag.find('time')[:title].should be_blank
    end

    it 'does not mutate the options hash' do
      options = { :tag => :foo }
      timestamp(1.minute.ago, options)

      options[:tag].should == :foo
    end
  end
end
