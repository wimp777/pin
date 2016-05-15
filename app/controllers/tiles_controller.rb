class TilesController < ApplicationController
  before_action :set_tile, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /tiles
  # GET /tiles.json
  def index
    @tiles = Tile.all
  end

  # GET /tiles/1
  # GET /tiles/1.json
  def show
  end

  # GET /tiles/new
  def new
    @tile = current_user.tiles.build
  end

  # GET /tiles/1/edit
  def edit
  end

  # POST /tiles
  # POST /tiles.json
  def create
    @tile = current_user.tiles.build(tile_params)

    respond_to do |format|
      if @tile.save
        format.html { redirect_to @tile, notice: 'Tile was successfully created.' }
        format.json { render :show, status: :created, location: @tile }
      else
        format.html { render :new }
        format.json { render json: @tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiles/1
  # PATCH/PUT /tiles/1.json
  def update
    respond_to do |format|
      if @tile.update(tile_params)
        format.html { redirect_to @tile, notice: 'Tile was successfully updated.' }
        format.json { render :show, status: :ok, location: @tile }
      else
        format.html { render :edit }
        format.json { render json: @tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiles/1
  # DELETE /tiles/1.json
  def destroy
    @tile.destroy
    respond_to do |format|
      format.html { redirect_to tiles_url, notice: 'Tile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tile
      @tile = Tile.find(params[:id])
    end

    def correct_user
      @tile = current_user.tiles.find(params[:id])
      redirect_to tiles_path, notice: "Not authorized to edit this tile" if @tile.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tile_params
      params.require(:tile).permit(:description, :image)
    end
end
