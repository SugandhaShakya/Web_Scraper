class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :size
      t.string :category
      t.text :contact_info

      t.timestamps
    end
  end
end
