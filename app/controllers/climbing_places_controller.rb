class ClimbingPlacesController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_climbing_place, only: %i[ show edit update destroy ]

  # GET /climbing_places or /climbing_places.json
  def index
    @climbing_places = ClimbingPlace.all

    @climbing_places = @climbing_places.search_by_country(params[:country]) if params[:country].present?

    @climbing_places = @climbing_places.near(params[:search], 50, units: :km) if params[:search].present?

    @pagy, @records = pagy(@climbing_places.order(created_at: :desc), limit: 15)
  end

  # GET /climbing_places/1 or /climbing_places/1.json
  def show
  end

  # GET /climbing_places/new
  def new
    @climbing_place = ClimbingPlace.new
    authorize @climbing_place
  end

  # GET /climbing_places/1/edit
  def edit
    authorize @climbing_place
  end

  # POST /climbing_places or /climbing_places.json
  def create
    @climbing_place = ClimbingPlace.new(climbing_place_params)
    @climbing_place.images = params.dig(:climbing_place, :images)
    @climbing_place.user = current_user

    authorize @climbing_place

    respond_to do |format|
      if @climbing_place.save
        format.html { redirect_to @climbing_place, notice: "Climbing place was successfully created." }
        format.json { render :show, status: :created, location: @climbing_place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @climbing_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /climbing_places/1 or /climbing_places/1.json
  def update
    authorize @climbing_place
    respond_to do |format|
      if @climbing_place.update(climbing_place_params)
        @climbing_place.images.attach(params.dig(:climbing_place, :images))
        format.html { redirect_to @climbing_place, notice: "Climbing place was successfully updated." }
        format.json { render :show, status: :ok, location: @climbing_place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @climbing_place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /climbing_places/1 or /climbing_places/1.json
  def destroy
    authorize @climbing_place
    @climbing_place.destroy!

    respond_to do |format|
      format.html { redirect_to climbing_places_path, status: :see_other, notice: "Climbing place was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_climbing_place
      @climbing_place = ClimbingPlace.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def climbing_place_params
      params.expect(climbing_place: [ :name, :address, :latitude, :longitude, :description, :link ])
    end
end
