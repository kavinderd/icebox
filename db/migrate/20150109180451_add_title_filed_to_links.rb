class AddTitleFiledToLinks < ActiveRecord::Migration
  def up
    add_column :links, :title, :string
  end

  def down
    remove_column :links, :title
  end
end
