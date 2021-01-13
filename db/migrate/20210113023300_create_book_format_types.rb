class CreateBookFormatTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :book_format_types do |t|
      t.string :name, null: false
      t.boolean :physical, null: false
      t.timestamps
    end
  end
end
