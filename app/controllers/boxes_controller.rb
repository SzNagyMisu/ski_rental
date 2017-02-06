class BoxesController < ApplicationController

  def index
    @boxes = Box.all.includes(:active_rental)
  end

end
