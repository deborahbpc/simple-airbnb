class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      flash[:success] = "Object successfully created"
      redirect_to @flat
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    @flat.save
    redirect_to @flat
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :number_of_guests, :price_per_night)
  end
end
