module Flutie
  module ViewHelper
    def body_class
      basic_body_class = "#{controller_name} #{controller_name}-#{action_name}"

      if content_for?(:extra_body_classes)
        [basic_body_class, content_for(:extra_body_classes)].join(' ')
      else
        basic_body_class
      end.gsub('/', '-')
    end

    def page_title
      content_tag :title, translate_by_controller_action(:page_title)
    end

    def page_description
      tag :meta,
        {
          content: translate_by_controller_action(:page_description),
          name: 'description'
        },
        true
    end

    def translate_by_controller_action(tag)
      key = [controller_name, action_name, tag].join('.').gsub('/', '-')
      I18n.t(key, default: '')
    end
  end
end
