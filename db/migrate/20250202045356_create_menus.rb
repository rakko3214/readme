class CreateMenus < ActiveRecord::Migration[7.2]
  def change
    create_table :menus do |t|
      t.string :title, null: false
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true

      t.timestamps
    end
    add_index :menus, [ :user_id, :recipe_id ], unique: true
  end
end
