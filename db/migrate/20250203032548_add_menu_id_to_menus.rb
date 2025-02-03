class AddMenuIdToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :menu_id, :bigint
  end
end
