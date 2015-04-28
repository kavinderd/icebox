class AddStatusToLink < ActiveRecord::Migration
  def up
    add_column :links, :status, :integer, default: 0
  end

  def down
    remove_column :links, :status
  end
end
