require 'flutie/body_class'
require 'flutie/body_class_helper'
require 'flutie/page_title'
require 'flutie/page_title_helper'

# :nodoc:
module Flutie
  # :nodoc:
  class Railtie < Rails::Railtie
    initializer 'page_title.helper' do |_app|
      ActionView::Base.send :include, PageTitleHelper
    end

    initializer 'body_class.helper' do |_app|
      ActionView::Base.send :include, BodyClassHelper
    end
  end
end
