class CreateBookFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :book_formats do |t|
      t.integer :book_id, null: false
      t.integer :book_format_type_id, null: false
      t.timestamps
    end
  end
end
