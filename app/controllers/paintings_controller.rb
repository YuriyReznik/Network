class PaintingsController < ApplicationController

  before_action :find_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = Painting.all
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.create(painting_params)
     if @painting.errors.empty?
      redirect_to edit_report_path(id: @painting.report_id)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @painting.update_attributes(painting_params)
    if @painting.errors.empty?
      redirect_to report_path(id: @painting.report_id)
    else
      render 'edit'
    end
  end

  def destroy
    @painting.destroy
    redirect_to :back
  end

  def find_painting
    @painting = Painting.find_by(id: params[:id])
  end

  private
  def painting_params
    params.require(:painting).permit(:report_id, :name, :image)
  end

end
