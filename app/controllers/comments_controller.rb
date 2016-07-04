class CommentsController < ApplicationController

  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.create(comment_params)
    if @comment.save
      redirect_to @report
    else
      flash.now[:danger] = "error"
    end
  end

  def destroy
    @report = Report.find(params[:report_id])
    @comment = @report.comments.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

end
