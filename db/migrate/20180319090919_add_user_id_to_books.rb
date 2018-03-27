class AddUserIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :user_id, :integer
    #add column user_id into table Book
  end
end
