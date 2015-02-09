class AddUserIdColumnToLinks < ActiveRecord::Migration
  def up
    add_column :links, :user_id, :integer
  end

  def down
    remove_column :links, :user_id
  end
end
