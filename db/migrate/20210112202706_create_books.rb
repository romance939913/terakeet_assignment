class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :publisher_id, null: false
      t.integer :author_id, null: false
      t.string :format, null: false
      t.boolean :physical, null: false
      t.timestamps
    end
  end
end
