class AddSeatsToHalls < ActiveRecord::Migration[5.2]
  def change
    add_column :halls, :seats, :integer
    add_column :halls, :rows, :integer
  end
end
