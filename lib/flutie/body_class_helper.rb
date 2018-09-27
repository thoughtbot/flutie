# :nodoc:
module BodyClassHelper
  def body_class(options = {})
    body_class = Flutie::BodyClass.new(options, controller)

    [
      body_class.basic_body_class,
      content_for(body_class.extra_body_classes_symbol)
    ]
      .compact
      .join(' ')
  end
end
