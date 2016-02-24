class AddWorkingAddresToClaims < ActiveRecord::Migration
  def change
    add_column :claims, :working_address, :string
  end
end
