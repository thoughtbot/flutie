class Flutie::StyleguidesController < ApplicationController

  unloadable

  def show
    @styleguides = styleguides
    render :layout => "flutie" if params[:flutie] == "true"
  end

  private

  def styleguides
    all_styleguide_partials = ActionController::Base.view_paths.map do |view_path|
      styleguide_path = File.join(view_path, 'styleguides')
      if File.exists?(styleguide_path)
        Dir.glob(styleguide_path + '/_*.*')
      else
        nil
      end
    end
    all_styleguide_partials.flatten.compact
  end
end
