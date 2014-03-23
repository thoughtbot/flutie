require 'rspec/expectations'
require 'i18n'
require 'action_view'
require File.expand_path('../../../app/helpers/flutie/view_helper', __FILE__)

module Flutie
  module Stubs
    def stub_controller_action(controller, action)
      helper.stub(controller_name: controller, action_name: action)
      helper.stub(content_for?: false)
    end

    def store_translations(translations)
      I18n.backend.store_translations(:en, translations)
    end

    def helper
      @helper ||= Class.new { include Flutie::ViewHelper }.new
    end
  end

  module ViewHelper
    include ActionView::Helpers::TagHelper
  end
end

RSpec.configure do |config|
  config.include Flutie::Stubs
  config.include RSpec::Matchers
  config.mock_framework = :rspec
end

describe Flutie::ViewHelper do
  describe '#body_class' do
    it 'handles normal controllers' do
      stub_controller_action('widgets', 'show')

      result = helper.body_class

      expect(result).to eq 'widgets widgets-show'
    end

    it 'handles nested controllers' do
      stub_controller_action('module/widgets', 'show')

      result = helper.body_class

      expect(result).to eq 'module-widgets module-widgets-show'
    end

    it 'handles extra body classes set via content_for' do
      stub_controller_action(:widgets, :show)
      helper.stub(content_for?: true)
      helper.stub(content_for: 'extra classes')

      result = helper.body_class

      expect(result).to eq 'widgets widgets-show extra classes'
    end
  end

  describe '#page_title' do
    it 'is blank by default' do
      stub_controller_action('widgets', 'show')
      store_translations({})

      result = helper.page_title

      expect(result).to eq '<title></title>'
    end

    it "uses the page's i18n locale when present" do
      stub_controller_action('widgets', 'show')
      store_translations(widgets: { show: { page_title: 'Widgets are fun' } })

      result = helper.page_title

      expect(result).to eq '<title>Widgets are fun</title>'
    end
  end

  describe '#page_description' do
    it 'is blank by default' do
      stub_controller_action('widgets', 'show')
      store_translations({})

      result = helper.page_description

      expect(result).to eq '<meta content="" name="description">'
    end

    it "uses the page's i18n locale when present" do
      stub_controller_action('widgets', 'show')
      store_translations(
        widgets: { show: { page_description: 'Widgets are fun' } }
      )

      result = helper.page_description

      expect(result).to eq '<meta content="Widgets are fun" name="description">'
    end
  end
end
