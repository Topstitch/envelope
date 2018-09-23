class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  def index
    @sort = params[:sort] || 'oldest'
    case @sort
    when 'oldest'
      @lists = List.all.order('created_at ASC')
    when 'newest'
      @lists = List.all.order('created_at DESC')
    when 'alphabetical'
      @lists = List.all.order('name ASC')
    end
  end

  # GET /lists/1
  def show
    @contacts = @list.contacts
    @correspondences = @list.correspondences
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_url, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      redirect_to lists_url, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:name, :notes)
  end
end
