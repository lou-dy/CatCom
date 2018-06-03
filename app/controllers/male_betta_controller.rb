class MaleBettaController < ApplicationController
  before_action :set_male_bettum, only: [:show, :edit, :update, :destroy]

  # GET /male_betta
  # GET /male_betta.json
  def index
    if params[:q]
      search_term = params[:q]
      @male_betta = MaleBettum.search(search_term)
    else
      @male_betta = MaleBettum.all
    end
  end

  # GET /male_betta/1
  # GET /male_betta/1.json
  def show
    @comments = @male_bettum.comments.order("created_at DESC")
  end

  # GET /male_betta/new
  def new
    @male_bettum = MaleBettum.new
  end

  # GET /male_betta/1/edit
  def edit
  end

  # POST /male_betta
  # POST /male_betta.json
  def create
    @male_bettum = MaleBettum.new(male_bettum_params)

    respond_to do |format|
      if @male_bettum.save
        format.html { redirect_to @male_bettum, notice: 'Male bettum was successfully created.' }
        format.json { render :show, status: :created, location: @male_bettum }
      else
        format.html { render :new }
        format.json { render json: @male_bettum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /male_betta/1
  # PATCH/PUT /male_betta/1.json
  def update
    respond_to do |format|
      if @male_bettum.update(male_bettum_params)
        format.html { redirect_to @male_bettum, notice: 'Male bettum was successfully updated.' }
        format.json { render :show, status: :ok, location: @male_bettum }
      else
        format.html { render :edit }
        format.json { render json: @male_bettum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /male_betta/1
  # DELETE /male_betta/1.json
  def destroy
    @male_bettum.destroy
    respond_to do |format|
      format.html { redirect_to male_betta_url, notice: 'Male bettum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_male_bettum
      @male_bettum = MaleBettum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def male_bettum_params
      params.require(:male_bettum).permit(:name, :description, :image_url, :color, :tail, :price, :pattern)
    end

end
