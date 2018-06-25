class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :rating
      t.string :image
      t.references :genre, foreign_key: true
      t.text :description
      t.string :adult_rating
      t.references :director, foreign_key: true
      t.references :company, foreign_key: true
      t.integer :movie_length
      t.date :release_date

      t.timestamps
    end
  end
end
