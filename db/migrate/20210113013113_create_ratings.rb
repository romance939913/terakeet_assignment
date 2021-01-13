class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :book_id, null: false
      t.integer :rating, null: false
      t.timestamps
    end
  end
end
