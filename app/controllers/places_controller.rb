class PlacesController < ApplicationController
  before_action :validates_token, except: %i[index]

  # GET /places
  def index
    places = Place.all
    render json: places, status: :ok
  end

  # POST /places
  def create
    place = Place.new(place_params)
    if place.save
      render json: place, status: :created
    else
      render json: { errors: place.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /places/:id
  def update
    place = Place.find(params[:id])
    if place.update(place_params)
      render json: place, status: :ok
    else
      render json: { errors: place.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /places/:id
  def destroy
    place = Place.find(params[:id])
    place.destroy
    render json: place, status: :ok
  end

  private

  def place_params
    params.require(:place).permit(:name, :country, :state, :location)
  end
end
