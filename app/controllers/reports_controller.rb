class ReportsController < ApplicationController

  before_action :find_report, only: [:show, :edit, :update, :destroy]

  def index
    @report = Report.all
  end

  def new
    @report = Report.new
  end

  def edit

  end

  def create
    @report = Report.create(report_params)
    if @report.errors.empty?
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
  end

  def update
    @report.update_attributes(report_params)
    if @report.errors.empty?
      redirect_to report_path(@report)
    else
      render 'new'
    end
  end

  def destroy
    @report.destroy
    redirect_to '/'
  end

  def find_report
    @report = Report.find_by(id: params[:id])
  end

  private
  def report_params
    params.require(:report).permit(:user_id, :title, :body)
  end

end
