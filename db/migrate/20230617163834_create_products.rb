# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :price
      t.string :inventory_quantity
      t.string :description
      t.string :image
      t.string :filling
      t.string :package

      t.timestamps
    end
  end
end
