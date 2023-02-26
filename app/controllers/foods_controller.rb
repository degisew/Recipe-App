class FoodsController < ApplicationController
  before_action :authenticate_user!
  # GET /foods or /foods.json
  def index
    @foods = Food.all.where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /foods/1 or /foods/1.json
  def show
    @food = Food.find_by(id: params[:id])
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    # @food = Food.new(food_params)
    # @food = current_user.foods.new(food_params)
    measurement_unit = params[:food][:measurement_unit]
    prices = params[:food][:price]
    quantity = params[:food][:quantity]

    @food = Food.new(user: current_user, name: params[:food][:name], measurement_unit:, price: prices, quantity:)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food = Food.find_by(id: params[:id])

    respond_to do |format|
      if @food.destroy
        format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      else
        format.html { redirect_to foods_url, error: 'Failed to Delete the Food.' }
      end
    end
  end
end
