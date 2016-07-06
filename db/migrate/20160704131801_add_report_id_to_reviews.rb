class AddReportIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :report_id, :integer
  end
end
