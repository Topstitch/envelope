class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  DB_PARAMS = [:recipient, :line_1, :line_2, :city, :state, :zip, :country,
               :category, :household_id, :verified_at, :notes].freeze
  OTHER_PARAMS = [:verify_now].freeze
  PARAMS_WHITELIST = DB_PARAMS + OTHER_PARAMS

  # GET /addresses
  def index
    @sort = params[:sort] || 'oldest'
    case @sort
    when 'oldest'
      @addresses = Address.all.order('created_at ASC')
    when 'newest'
      @addresses = Address.all.order('created_at DESC')
    when 'alphabetical'
      @addresses = Address.all.order('recipient ASC')
    when 'orphans'
      @addresses = Address.orphans.order('recipient ASC')
    end
  end

  # GET /addresses/1
  def show
    @household = @address.household
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
    @address = Address.new(db_params)
    if @address.save && @address.verify_now(other_params[:verify_now])
      redirect_to @address, notice: 'Address was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(db_params) && @address.verify_now(other_params[:verify_now])
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
    params.require(:address).permit(*PARAMS_WHITELIST)
  end

  def db_params
    address_params.except(*OTHER_PARAMS)
  end

  def other_params
    address_params.extract!(*OTHER_PARAMS)
  end
end
