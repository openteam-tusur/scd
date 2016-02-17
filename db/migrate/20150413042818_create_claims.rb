class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.string :surname
      t.string :name
      t.string :patronymic
      t.string :email
      t.date :birthdate
      t.string :gender
      t.string :contact_phone
      t.string :work_phone
      t.string :academic_degree
      t.string :academic_status
      t.string :post
      t.text :organization_title
      t.string :organization_abbr
      t.string :postcode
      t.string :country
      t.string :region
      t.string :district
      t.string :locality
      t.string :street
      t.string :house
      t.string :building

      t.timestamps
    end
  end
end
