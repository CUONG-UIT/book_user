class AddCategoryIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :category_id, :integer

    #add category_id column into Book table
  end
end
