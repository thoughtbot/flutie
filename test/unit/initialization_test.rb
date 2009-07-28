require 'test_helper'

class InitializationTest < ActiveSupport::TestCase

  should "register stylesheet expansions with rails" do
    expected = {:flutie => [
      '/flutie/stylesheets/reset',
      '/flutie/stylesheets/defaults',
      '/flutie/stylesheets/type',
      '/flutie/stylesheets/forms',
      '/flutie/stylesheets/tables',
      '/flutie/stylesheets/lists',
      '/flutie/stylesheets/screen']
    }
    assert_equal expected, ActionView::Helpers::AssetTagHelper.send(:class_variable_get, :@@stylesheet_expansions)
  end

end
