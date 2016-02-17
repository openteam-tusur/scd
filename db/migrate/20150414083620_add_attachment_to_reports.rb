class AddAttachmentToReports < ActiveRecord::Migration
  def change
    add_attachment :reports, :attachment
  end
end
