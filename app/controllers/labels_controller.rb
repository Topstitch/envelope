class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]

  # GET /labels
  def index
    @sort = params[:sort] || 'oldest'
    case @sort
    when 'oldest'
      @labels = Label.all.order('created_at ASC')
    when 'newest'
      @labels = Label.all.order('created_at DESC')
    when 'alphabetical'
      @labels = Label.all.order('name ASC')
    end
  end

  # GET /labels/1
  def show
    @contacts = @label.contacts
    @correspondences = @label.correspondences
  end

  # GET /labels/new
  def new
    @label = Label.new
  end

  # GET /labels/1/edit
  def edit
  end

  # POST /labels
  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to labels_url, notice: 'Label was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /labels/1
  def update
    if @label.update(label_params)
      redirect_to labels_url, notice: 'Label was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /labels/1
  def destroy
    @label.destroy
    redirect_to labels_url, notice: 'Label was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_label
    @label = Label.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def label_params
    params.require(:label).permit(:name)
  end
end
