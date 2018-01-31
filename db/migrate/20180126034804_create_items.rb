class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :title
      t.text :description
      t.numeric :unit_price

      t.string :image

      t.timestamps
    end
  end
end
