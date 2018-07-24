class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
