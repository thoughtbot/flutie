if defined?(Sass::Plugin) && defined?(Rails)
  Sass::Plugin.add_template_location(Rails.root.join('public', 'flutie', 'stylesheets', 'sass').to_s)
end
