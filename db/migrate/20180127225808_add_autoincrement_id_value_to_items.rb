class AddAutoincrementIdValueToItems < ActiveRecord::Migration[5.1]
  def change
    execute("SELECT setval('merchants_id_seq', 1367)") 
  end
end
