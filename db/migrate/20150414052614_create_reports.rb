class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :title
      t.text :authors
      t.string :kind
      t.string :section
      t.text :annotation
      t.belongs_to :claim

      t.timestamps
    end
  end
end
