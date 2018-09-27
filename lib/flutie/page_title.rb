# :nodoc:
module Flutie
  # :nodoc:
  class PageTitle
    DEFAULT_PAGE_TITLE_SYMBOL = :page_title
    DEFAULT_SEPARATOR = ' : '.freeze

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def app_name
      options[:app_name] || rails_app_name
    end

    def page_title_symbol
      options[:page_title_symbol] || DEFAULT_PAGE_TITLE_SYMBOL
    end

    def separator
      options[:separator] || DEFAULT_SEPARATOR
    end

    private

    def rails_app_name
      Rails.application.class.to_s.split('::').first
    end
  end
end
