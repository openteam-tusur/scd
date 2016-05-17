class AddArrivalTimeToClaim < ActiveRecord::Migration
  def change
    add_column :claims, :arrival_time, :datetime
    add_column :claims, :arrival_transport, :string
    add_column :claims, :departure_time, :datetime
    add_column :claims, :departure_transport, :string
    add_column :claims, :already_in_tomsk, :boolean
  end
end
