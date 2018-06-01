class CorrespondencesController < ApplicationController
  before_action :set_correspondence, only: [:show, :edit, :update, :destroy]

  # GET /correspondences
  # GET /correspondences.json
  def index
    @correspondences = Correspondence.all
  end

  # GET /correspondences/1
  # GET /correspondences/1.json
  def show; end

  # GET /correspondences/new
  def new
    @correspondence = Correspondence.new
  end

  # GET /correspondences/1/edit
  def edit; end

  # POST /correspondences
  # POST /correspondences.json
  def create
    @correspondence = Correspondence.new(correspondence_params)

    respond_to do |format|
      if @correspondence.save
        format.html { redirect_to @correspondence, notice: 'Correspondence was successfully created.' }
        format.json { render :show, status: :created, location: @correspondence }
      else
        format.html { render :new }
        format.json { render json: @correspondence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /correspondences/1
  # PATCH/PUT /correspondences/1.json
  def update
    respond_to do |format|
      if @correspondence.update(correspondence_params)
        format.html { redirect_to @correspondence, notice: 'Correspondence was successfully updated.' }
        format.json { render :show, status: :ok, location: @correspondence }
      else
        format.html { render :edit }
        format.json { render json: @correspondence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /correspondences/1
  # DELETE /correspondences/1.json
  def destroy
    @correspondence.destroy
    respond_to do |format|
      format.html { redirect_to correspondences_url, notice: 'Correspondence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_correspondence
    @correspondence = Correspondence.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def correspondence_params
    params.fetch(:correspondence, {})
  end
end
