class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.string :serial
      t.references :box, foreign_key: true
      t.string :customer_name
      t.string :customer_identifier
      t.integer :days
      t.boolean :is_active
      t.integer :payed

      t.timestamps
    end
  end
end
