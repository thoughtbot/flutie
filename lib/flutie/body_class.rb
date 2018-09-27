# :nodoc:
module Flutie
  # :nodoc:
  class BodyClass
    DEFAULT_EXTRA_CLASS_SYMBOL = :extra_body_classes
    attr_reader :options, :controller

    def initialize(options, controller)
      @options = options
      @controller = controller
    end

    def basic_body_class
      [controller_part, action_part].join(' ')
    end

    def extra_body_classes_symbol
      options[:extra_body_classes_symbol] || DEFAULT_EXTRA_CLASS_SYMBOL
    end

    private

    def controller_part
      qualified_controller_name
    end

    def action_part
      [qualified_controller_name, action_name].join('-')
    end

    def qualified_controller_name
      controller_path.tr('/', '-')
    end

    def action_name
      controller.action_name
    end

    def controller_path
      controller.controller_path
    end
  end
end
