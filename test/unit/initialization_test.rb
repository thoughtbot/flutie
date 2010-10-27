require 'test_helper'

class InitializationTest < ActiveSupport::TestCase

  should "register stylesheet expansions with rails" do
    expected = { :flutie => ['/flutie/stylesheets/flutie'] }
    assert_equal expected, ActionView::Helpers::AssetTagHelper.send(:class_variable_get, :@@stylesheet_expansions)
  end

  should "register the scss template location" do
    matches = Sass::Plugin.template_location_array.any? do |location|
      location.first.match /\/public\/flutie\/stylesheets\/sass/
    end
    assert matches
  end

end
