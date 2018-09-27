# :nodoc:
module PageTitleHelper
  def page_title(options = {})
    page_title = Flutie::PageTitle.new(options)

    Flutie::PageTitlePresenter.new(
      page_title.app_name,
      content_for(page_title.page_title_symbol),
      page_title.separator,
      options[:reverse]
    ).to_s
  end
end
