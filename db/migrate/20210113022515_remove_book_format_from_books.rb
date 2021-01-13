class RemoveBookFormatFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :format
    remove_column :books, :physical
  end
end
