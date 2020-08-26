class AddDifficultyToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :difficulty, :string
  end
end
