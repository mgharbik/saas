class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :client
      t.boolean :archived, default: false, null: false

      t.timestamps null: false
    end
  end
end
