class LandingsController < ApplicationController
  def index
    @boxes = Box.all
    @rentals = Rental.all
  end

  def change_locale
    session[:locale] = params[:lng]
  end
end
