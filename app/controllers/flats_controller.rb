class FlatsController < ApplicationController
  before_action :set_flat, only: [:show]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
  end

  def create
    @object = Object.new(params[:object])
    if @object.save
      flash[:success] = "Object successfully created"
      redirect_to @object
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  

  def edit
  end

  def update
  end
  
  def destroy
    @object = Object.find(params[:id])
    if @object.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to objects_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to objects_url
    end
  end
  
  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(flat).permit(:name, :description, :address, :number_of_guests, :price_per_night)
  end
end
