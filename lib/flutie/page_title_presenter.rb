# :nodoc:
module Flutie
  # :nodoc:
  class PageTitlePresenter
    attr_reader :app_name, :content, :separator, :reversed

    def initialize(app_name, content, separator, reversed = false)
      @app_name = app_name
      @content = content
      @separator = separator
      @reversed = reversed
    end

    def to_s
      ordered_parts.compact.join(separator)
    end

    def ordered_parts
      if reversed_order?
        [content, app_name]
      else
        [app_name, content]
      end
    end

    private

    def reversed_order?
      @reversed
    end
  end
end
