class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :cooking_time, null: false
      t.string :ingredient, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
