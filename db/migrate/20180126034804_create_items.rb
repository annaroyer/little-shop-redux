class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :title
      t.text :description
      t.numeric :unit_price
      t.float :price, precision: 12, scale: 2
      t.string :image

      t.timestamps
    end
  end
end
