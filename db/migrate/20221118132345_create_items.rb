class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.string :description, null: true
      t.float :price, null:false, defautl:0

      t.timestamps
    end
  end
end
