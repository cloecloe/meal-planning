class ChangeServingToStringInRecipes < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :serving, :string
  end
end
