class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :recipe, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
