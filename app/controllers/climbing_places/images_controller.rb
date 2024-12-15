class ClimbingPlaces::ImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_climbing_place

  def destroy
    @climbing_place.images.find(params[:id]).purge
    redirect_to @climbing_place, notice: "Image deleted successfully."
  end

  private

  def set_climbing_place
    @climbing_place = ClimbingPlace.find(params[:climbing_place_id])
  end
end
