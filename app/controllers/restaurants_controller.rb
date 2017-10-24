class RestaurantsController < ApplicationController
  before_action :set_restaurant,
  only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    # create_restaurant
    @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        render plain: "Success", status: 201
      else
        render plain: "failure", status: 422
      end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    update_restaurant
  end

  def review
    @restaurant = Restaurant.find_by(id: params[:id])
    create_review
    redirect_to "/restaurants/#{@restaurant.id}"
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    current_user
    if @restaurant.user_id == @current_user.id
      @restaurant.destroy!
      redirect_to '/restaurants'
    else
      status 422
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :cuisine, :address, :city, :state, :zip)
    end
end
