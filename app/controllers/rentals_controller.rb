class RentalsController < ApplicationController
  before_action :find_rental, only: [:show, :edit, :update, :end]

  # GET /rentals
  def index
    @rentals = Rental.active
  end

  # GET /rentals/1
  def show
    @fine = @rental.count_fine
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
  end

  # POST /rentals
  def create
    box = Box.find(params[:box_id])
    @rental = box.create_active_rental(rental_params)

    if @rental.errors.empty?
      redirect_to @rental, notice: t('rentals.created')
    else
      render :new
    end
  end

  # GET /rentals/1/edit
  def edit
  end

  # PATCH/PUT /rentals/1
  def update
    if @rental.update(rental_params)
      redirect_to @rental, notice: t('rentals.updated')
    else
      render :edit
    end
  end

  def end
    @rental.update(fine: params[:fine], is_active: false)
    redirect_to @rental, notice: t('rentals.ended')
  end

  def total
    @rentals = Rental.all
  end

  def search
    @rentals = Rental.active.search(params[:serial])
    render :index
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def find_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:customer_name, :customer_identifier, :days, :price, :fine)
    end
end
