class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.text :name
      t.timestamp
    end
  end
end
