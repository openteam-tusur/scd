class RemoveCountryFromClaim < ActiveRecord::Migration
  def change
    remove_column :claims, :birthdate
    remove_column :claims, :gender
    remove_column :claims, :contact_phone
    remove_column :claims, :work_phone
    remove_column :claims, :postcode
    remove_column :claims, :country
    remove_column :claims, :region
    remove_column :claims, :district
    remove_column :claims, :locality
    remove_column :claims, :street
    remove_column :claims, :house
    remove_column :claims, :building
  end
end
