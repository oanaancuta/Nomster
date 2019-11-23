class PlacesController < ApplicationController

  def index
    @places = Place.all.paginate(:page => params[:page], :per_page => 3)
  end

  def new
    @place = Place.new
  end

  
  def create
    Place.create(place_params)
    redirect_to root_path
  end

  private

  
  def place_params
    params.require(:place).permit(:name, :address, :description)
  end


end

# Lines 12 - 15 are used to store place in the database and redirect user to places controller, index action - root Prefix (using rake routes command) => send user to root_path
# Lines 20 - 22 are used to pull the user provided name, address, description values from the form