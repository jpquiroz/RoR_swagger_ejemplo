class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]

  # GET /api/v1/cars
  def index
    @cars = Car.all

    render json: @cars
  end

  # GET /api/v1/cars/1
  def show
    render json: @car.to_json(only: [:id, :nombre, :status, :foto_url])

  end

  # POST /api/v1/cars
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: @car.to_json(only: [:id, :nombre, :status, :foto_url]), status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/cars/1
  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/cars/1
  def destroy
    @car.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.fetch(:car).permit(:nombre, :status, :foto_url)
    end
  end
