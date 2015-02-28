class CitiesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @cities = City.paginate(:page => params[:page])
  end

  def new
  end
 
  def create
    @city = City.new(city_params)
 
    if @city.save
      redirect_to @city
    else
      render 'new'
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])

    if @city.update(city_params)
      redirect_to @city
    else
      render 'edit'
    end
  end

  def show
    @city = City.find(params[:id])
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy

    redirect_to cities_path
  end

  private
    def city_params
      params.require(:city).permit(:name, :short_name)
    end

end
