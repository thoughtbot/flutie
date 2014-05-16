# :nodoc:
module PageTitleHelper
  def page_title(options = {})
    page_title = Flutie::PageTitle.new(options)

    parts = case options[:reverse]
    when true
      [
        content_for(page_title.page_title_symbol),
        page_title.app_name
      ]
    else
      [
        page_title.app_name,
        content_for(page_title.page_title_symbol)
      ]
    end

    parts.compact.join(page_title.separator)
  end
end
