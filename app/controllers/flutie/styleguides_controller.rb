class Flutie::StyleguidesController < ApplicationController

  unloadable

  def show
    render :layout => "flutie" if params[:flutie] == "true"
  end

end
