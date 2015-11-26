class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :shortdesc
      t.string :longdesc
      t.string :grapetype
      t.boolean :forvegeterians
      t.string :origin
      t.string :bottlesize
      t.float :price
      t.string :supplier

      t.timestamps null: false
    end
  end
end
