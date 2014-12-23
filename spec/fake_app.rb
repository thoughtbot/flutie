module Flutie
  class Application < Rails::Application
    config.secret_key_base = 'test'
    config.eager_load = false
  end
end
