class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.references :hall, foreign_key: true
      t.references :movie, foreign_key: true
      t.datetime :show_time

      t.timestamps
    end
  end
end
