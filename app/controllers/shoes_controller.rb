class ShoesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_user_shoes, only: [:edit, :update, :destroy]
  before_action :set_vars, only: [:new, :create, :edit, :update]
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]

  # GET /shoes
  # GET /shoes.json
  def index
    # @shoes = Shoe.all
    @q =  Shoe.ransack(params[:q])
    @shoes = @q.result(distinct: true)
  end

  # GET /shoes/1
  # GET /shoes/1.json
  def show
  end

  # GET /shoes/new
  def new
    
    @shoe = Shoe.new
  end

  # GET /shoes/1/edit
  def edit
  end

  # POST /shoes
  # POST /shoes.json
  def create
    @shoe = current_user.shoes.new(shoe_params)

    respond_to do |format|
      if @shoe.save
        format.html { redirect_to @shoe, notice: 'Shoe was successfully created.' }
        format.json { render :show, status: :created, location: @shoe }
      else
        format.html { render :new }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoes/1
  # PATCH/PUT /shoes/1.json
  def update
    respond_to do |format|
      if @shoe.update(shoe_params)
        format.html { redirect_to @shoe, notice: 'Shoe was successfully updated.' }
        format.json { render :show, status: :ok, location: @shoe }
      else
        format.html { render :edit }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoes/1
  # DELETE /shoes/1.json
  def destroy
    @shoe.destroy
    respond_to do |format|
      format.html { redirect_to shoes_url, notice: 'Shoe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user_shoes
    id = params[:id]
    @shoe = current_user.shoes.find_by_id(id)

    if @shoe == nil
        redirect_to shoes_path
    end
end
  def set_vars
    @conditions = Shoe.conditions.keys
    @locations = Location.all
end

    # Use callbacks to share common setup or constraints between actions.
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shoe_params
      params.require(:shoe).permit(:brand, :model, :condition, :price, :description, :location_id, picture: [])
    end
end
