class AddReportFileToReports < ActiveRecord::Migration
  def up
    add_attachment :reports, :report_file
  end

  def down
    remove_attachment :reports, :report_file
  end
end
