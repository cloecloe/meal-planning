class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredients, array: true, default: []
      t.text :instructions, array: true, default: []
      t.references :user, null: false, foreign_key: true
      t.boolean :displayed, default: true
      t.integer :serving
      t.integer :preptime

      t.timestamps
    end
  end
end
