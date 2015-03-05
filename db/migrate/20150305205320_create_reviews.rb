class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.string :body
      t.integer :rating
      t.belongs_to :movie, index: true
    end
    add_foreign_key :reviews, :movies
  end
end
