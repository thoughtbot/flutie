module PageTitleHelper
  def page_title(options = {})
    app_name = options[:app_name] || Rails.application.class.to_s.split('::').first
    page_title_symbol = options[:page_title_symbol] || :page_title
    separator = options[:separator] || ' : '

    [app_name, content_for(page_title_symbol)].compact.join(separator)
  end
end
