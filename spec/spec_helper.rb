RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed
end
