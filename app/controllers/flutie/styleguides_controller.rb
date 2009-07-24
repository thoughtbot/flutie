class Flutie::StyleguidesController < ApplicationController

  unloadable

  def show
    render :template => 'styleguides/show'
  end

end
