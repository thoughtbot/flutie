require 'flutie/body_class_helper'
require 'flutie/page_title_helper'
require 'flutie/timestamp_helper'

module Flutie

  class Railtie < Rails::Railtie
    initializer 'page_title.helper' do |app|
      ActionView::Base.send :include, PageTitleHelper
    end
    initializer 'body_class.helper' do |app|
      ActionView::Base.send :include, BodyClassHelper
    end
    initializer 'timestamp.helper' do |app|
      ActionView::Base.send :include, TimestampHelper
    end
  end

end
