class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :total_gross
      t.string :release_date
      t.string :MPAA_rating
      t.text :description
      t.timestamps
    end
  end
end
