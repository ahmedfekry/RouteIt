class MetrosController < ApplicationController
  before_action :set_metro, only: [:show, :edit, :update, :destroy]

  # GET /metros
  # GET /metros.json
  def index
    @metros = Metro.all
  end

  # GET /metros/1
  # GET /metros/1.json
  def show
  end

  # GET /metros/new
  def new
    @metro = Metro.new
  end

  # GET /metros/1/edit
  def edit
  end

  # POST /metros
  # POST /metros.json
  def create
    @metro = Metro.new(metro_params)

    respond_to do |format|
      if @metro.save
        format.html { redirect_to @metro, notice: 'Metro was successfully created.' }
        format.json { render :show, status: :created, location: @metro }
      else
        format.html { render :new }
        format.json { render json: @metro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metros/1
  # PATCH/PUT /metros/1.json
  def update
    respond_to do |format|
      if @metro.update(metro_params)
        format.html { redirect_to @metro, notice: 'Metro was successfully updated.' }
        format.json { render :show, status: :ok, location: @metro }
      else
        format.html { render :edit }
        format.json { render json: @metro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metros/1
  # DELETE /metros/1.json
  def destroy
    @metro.destroy
    respond_to do |format|
      format.html { redirect_to metros_url, notice: 'Metro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metro
      @metro = Metro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metro_params
      params.require(:metro).permit(:name, :long, :lat)
    end
end
