class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  def index
    @sort = params[:sort] || 'oldest'
    case @sort
    when 'oldest'
      @addresses = Address.all.order('created_at ASC')
    when 'newest'
      @addresses = Address.all.order('created_at DESC')
    when 'alphabetical'
      @addresses = Address.all.order('to ASC')
    when 'orphans'
      @addresses = Address.where(household_id: nil).order('to ASC')
    end
  end

  # GET /addresses/1
  def show
    @household = self.household
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to @address, notice: 'Address was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      redirect_to @address, notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
    redirect_to addresses_url, notice: 'Address was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Address.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def address_params
    params.require(:household).permit(:to, :line_1, :line_2, :city, :state, :zip, :country, :category, :household_id, :verified_at, :notes)
  end
end
