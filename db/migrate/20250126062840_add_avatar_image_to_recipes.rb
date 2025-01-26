class AddAvatarImageToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :avatar, :string
  end
end
