class CreateToys < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.string :toyname
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end
