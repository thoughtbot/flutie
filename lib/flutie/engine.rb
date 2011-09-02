module Flutie

  class Engine < Rails::Engine
    initializer 'page_title.helper' do |app|
      ActionView::Base.send :include, PageTitleHelper
    end
    initializer 'body_class.helper' do |app|
      ActionView::Base.send :include, BodyClassHelper
    end
  end

end
