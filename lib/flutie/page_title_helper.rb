# :nodoc:
module PageTitleHelper
  def page_title(options = {})
    page_title = Flutie::PageTitle.new(options)

    [
      page_title.app_name,
      content_for(page_title.page_title_symbol)
    ]
      .compact
      .join(page_title.separator)
  end
end
