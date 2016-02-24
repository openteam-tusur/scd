class AddTitleOfReportToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :title_of_report, :string
  end
end
