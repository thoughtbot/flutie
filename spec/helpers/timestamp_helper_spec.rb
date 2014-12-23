require 'rails_helper'

describe TimestampHelper, '#timestamp', type: :helper do
  it 'creates a time tag with a datetime and the relative date' do
    time = 10.minutes.ago

    tag = Capybara.string(timestamp(time)).find('time')

    expect(tag).to have_content(time_ago_in_words(time))
    expect(tag[:title]).to eq(l(time))
    expect(tag[:datetime]).to eq(time.to_s)
  end

  context 'with optional arguments' do
    it 'uses tag rather than a <time>' do
      tag = Capybara.string timestamp(1.minute.ago, :tag => :span)

      expect(tag).to have_css('span')
    end

    it 'skips the title attribute when :title => false' do
      tag = Capybara.string timestamp(1.minute.ago, :title => false)

      expect(tag.find('time')[:title]).to be_blank
    end

    it 'does not mutate the options hash' do
      options = { :tag => :foo }
      timestamp(1.minute.ago, options)

      expect(options[:tag]).to eq :foo
    end
  end
end
