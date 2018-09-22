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
  def show
    @contacts = @household.contacts
    @addresses = @household.addresses
    @correspondences_from = @household.correspondences_from
    @correspondences_to = @household.correspondences_to
  end

  # GET /households/new
  def new
    @household = Household.new
  end

  # GET /households/1/edit
  def edit
  end

  # POST /households
  def create
    @household = Household.new(household_params)
    if @household.save
      redirect_to households_url, notice: 'Household was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /households/1
  def update
    if @household.update(household_params)
      redirect_to households_url, notice: 'Household was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /households/1
  def destroy
    @household.destroy
    redirect_to households_url, notice: 'Household was successfully destroyed.'
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
