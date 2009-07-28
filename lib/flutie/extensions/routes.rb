if defined?(ActionController::Routing::RouteSet) && defined?(Rails) && !Rails.env.production?
  class ActionController::Routing::RouteSet
    def load_routes_with_flutie!
      lib_path = File.dirname(__FILE__)
      flutie_routes = File.join(lib_path, *%w[.. .. .. config flutie_routes.rb])
      unless configuration_files.include?(flutie_routes)
        add_configuration_file(flutie_routes)
      end
      load_routes_without_flutie!
    end

    alias_method_chain :load_routes!, :flutie
  end
end
