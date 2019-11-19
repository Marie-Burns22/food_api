class Api::V1::FoodsController < ApplicationController
  before_action :set_food, only: [:show, :update, :destroy]

  # GET /foods
  def index
    @foods = Food.all

    render json: FoodSerializer.new(@foods)
  end

  # GET /foods/1
  def show
    render json: FoodSerializer.new(@food)
  end

  # POST /foods
  def create
    @food = Food.new(food_params)

    if @food.save
      render json: FoodSerializer.new(@food), status: :created, location: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      render json: FoodSerializer.new(@food)
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def food_params
      params.require(:food).permit(:category, :emission_amount)
    end
end
