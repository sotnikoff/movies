class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :show, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :row
      t.integer :seat

      t.timestamps
    end
  end
end
