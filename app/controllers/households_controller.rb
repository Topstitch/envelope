class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :edit, :update, :destroy]

  # GET /households
  # GET /households.json
  def index
    @sort = params[:sort] || 'oldest'
    case @sort
    when 'oldest'
      @households = Household.all.order('created_at ASC')
    when 'newest'
      @households = Household.all.order('created_at DESC')
    when 'alphabetical'
      @households = Household.all.order('name ASC')
    end
  end

  # GET /households/1
  # GET /households/1.json
  def show
    @contacts = @household.contacts
    @addresses = @household.addresses
  end

  # GET /households/new
  def new
    @household = Household.new
  end

  # GET /households/1/edit
  def edit
  end

  # POST /households
  # POST /households.json
  def create
    @household = Household.new(household_params)

    respond_to do |format|
      if @household.save
        format.html { redirect_to households_url, notice: 'Household was successfully created.' }
        format.json { render :show, status: :created, location: @household }
      else
        format.html { render :new }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /households/1
  # PATCH/PUT /households/1.json
  def update
    respond_to do |format|
      if @household.update(household_params)
        format.html { redirect_to households_url, notice: 'Household was successfully updated.' }
        format.json { render :show, status: :ok, location: @household }
      else
        format.html { render :edit }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /households/1
  # DELETE /households/1.json
  def destroy
    @household.destroy
    respond_to do |format|
      format.html { redirect_to households_url, notice: 'Household was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_household
    @household = Household.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def household_params
    params.require(:household).permit(:name, :description, :notes, :anniversary)
  end
end
