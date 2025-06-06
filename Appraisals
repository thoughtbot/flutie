rails_versions = %w(
  6.1
  7.0
  7.1
  7.2
  8.0
)

rails_versions.each do |version|
  appraise "rails_#{version}" do
    gem "rails", "~> #{version}.0"

    # Gem dependencies for older Rails versions
    # Remove these when we drop support for Rails 6.1
    if Gem::Version.new(version) <= Gem::Version.new('6.1')
      gem "base64"
    end


    # Remove these when we drop support for Rails 7.0
    if Gem::Version.new(version) <= Gem::Version.new('7.0')
      gem "bigdecimal"
      gem "mutex_m"
      gem "drb"
      gem 'concurrent-ruby', '1.3.4'
    end
  end
end

appraise "rails_main" do
  gem "rails", github: "rails/rails", branch: "main"
end
